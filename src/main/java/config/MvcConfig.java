package config;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.resource.PathResourceResolver;

import com.zaxxer.hikari.HikariDataSource;

import util.LoginInterceptor;

@Configuration
@ComponentScan(basePackages = { "kr.co.recipick","util" })
@EnableWebMvc
@MapperScan(basePackages = { "kr.co.recipick" }, annotationClass = Mapper.class) // 인터페이스 스캔
@EnableTransactionManagement
public class MvcConfig implements WebMvcConfigurer {
	// 파일업로드
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipart = new CommonsMultipartResolver();
		// 파일사이즈
		multipart.setMaxUploadSize(1024 * 1024 * 5);
		multipart.setDefaultEncoding("utf-8");
		return multipart;
	}

	// db.properties에 있는 속성
	@Value("${db.driver}")
	private String driver;
	@Value("${db.url}")
	private String url;
	@Value("${db.username}")
	private String username;
	@Value("${db.password}")
	private String password;
	
	// 정적 리소스 경로 설정
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/css/**")
                .addResourceLocations("/css/");
        registry.addResourceHandler("/js/**")
                .addResourceLocations("/js/");
        registry.addResourceHandler("/images/**")
                .addResourceLocations("/images/");
        registry.addResourceHandler("/libs/**")
		        .addResourceLocations("/libs/")
		        .setCachePeriod(3600)  // 캐싱 설정 추가
		        .resourceChain(true)   // 리소스 체인 활성화
		        .addResolver(new PathResourceResolver());  // 경로 리졸버 추가
    }

	// ViewResolver 설정(JSP 경로)
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp("/WEB-INF/views/", ".jsp");
	}

	// 정적페이지 처리(컨트롤러가 아니라 톰캣에서 처리하기 위해)
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}

	// 비즈니스 로직이 필요없는 URL 매핑
	// 여기에 단순히 url 매핑만 해줘야하는 페이지 등록
	@Override
	public void addViewControllers(ViewControllerRegistry reg) {
		reg.addViewController("/index.do");
		reg.addViewController("/member/regist.do");
		reg.addViewController("/member/login.do");
	}
	
	// HikariCP
	@Bean
	public HikariDataSource dataSource() {
		HikariDataSource dataSource = new HikariDataSource();
//			dataSource.setDriverClassName("oracle.jdbc.OracleDriver");
//			dataSource.setJdbcUrl("jdbc:oracle:thin:@localhost:1521:XE");
		dataSource.setDriverClassName(driver);
		dataSource.setJdbcUrl(url);
		dataSource.setUsername(username);
		dataSource.setPassword(password);
		return dataSource;
	}

	// MyBatis
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean ssf = new SqlSessionFactoryBean();
		ssf.setDataSource(dataSource()); // CP 객체 주입

		// xml 파일(Mapper파일) 위치(경로)
//			PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
//			ssf.setMapperLocations(resolver.getResources("classpath:/mapper/**/*.xml"));
		return ssf.getObject();
	}
	// DAO에서 주입받을 객체
//		@Bean
//		public SqlSessionTemplate sqlSessionTemplate() throws Exception {
//			return new SqlSessionTemplate(sqlSessionFactory()); // MyBatis 객체(빈)를 주입
//		}

	// 트랜잭션 설정
	@Bean
	public PlatformTransactionManager transactionManager() {
		DataSourceTransactionManager dtm = new DataSourceTransactionManager(dataSource());
//			dtm.setDataSource(dataSource());
		return dtm;
	}

	// 로그인인터셉터 빈등록
	@Bean
	public LoginInterceptor loginInterception() {
		return new LoginInterceptor();
	}

	// 인터셉터 설정
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// url 설정
		registry.addInterceptor(loginInterception())
				.addPathPatterns("/**")
				.excludePathPatterns("/reply/index.do")
				.excludePathPatterns("/reply/view.do")
				.addPathPatterns("/member/edit.do");
		//로그인, 회원가입관련페이지는 exclude 설정해줘야함 관리자페이지도 마찬가지
		/*
		 * 관리자페이지 .addPathPatterns("/admin/**") .excludePathPatterns("/admin/login.do")
		 */
	}

	// properties 설정
	@Bean
	public static PropertyPlaceholderConfigurer propreties() {
		PropertyPlaceholderConfigurer config = new PropertyPlaceholderConfigurer();
		config.setLocations(new ClassPathResource("db.properties"));
		return config;
	}
	
	
	@Bean
	public static PropertyPlaceholderConfigurer oauthProperties() {
	    PropertyPlaceholderConfigurer config = new PropertyPlaceholderConfigurer();
	    config.setLocations(new ClassPathResource("oauth.properties"));
	    return config;
	}
}
