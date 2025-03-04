package kr.co.recipick.community;

import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Base64;
import javax.imageio.ImageIO;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ImageService {
    // 각 용도별 이미지 크기 정의
//    private static final int PREVIEW_WIDTH = 150;    // 작성/수정 페이지 미리보기용
//    private static final int THUMBNAIL_WIDTH = 300;  // 목록 페이지용
    private static final int DETAIL_WIDTH = 800;     // 상세 페이지용
    
//    // 미리보기 이미지 생성 (작성/수정 페이지용)
//    public String createPreviewImage(MultipartFile file) throws IOException {
//        byte[] previewBytes = resizeImage(file, PREVIEW_WIDTH);
//        return "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(previewBytes);
//    }
//    
//    // 썸네일 이미지 생성 (목록 페이지용)
//    public String createTumbnailImage(MultipartFile file) throws IOException {
//        byte[] detailBytes = resizeImage(file, THUMBNAIL_WIDTH);
//        return "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(detailBytes);
//    }
    
    // 실제 저장용 이미지 생성 (상세 페이지용)
    public String createDetailImage(MultipartFile file) throws IOException {
        byte[] detailBytes = resizeImage(file, DETAIL_WIDTH);
        return "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(detailBytes);
    }
    
    private byte[] resizeImage(MultipartFile file, int targetWidth) throws IOException {
        BufferedImage originalImage = ImageIO.read(file.getInputStream());
        
        // 원본 이미지가 타겟 크기보다 작은 경우 리사이징하지 않음
        if (originalImage.getWidth() <= targetWidth) {
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write(originalImage, "jpg", baos);
            return baos.toByteArray();
        }
        
        // 비율 계산
        float ratio = (float) originalImage.getHeight() / originalImage.getWidth();
        int targetHeight = Math.round(targetWidth * ratio);
        
        BufferedImage resizedImage = new BufferedImage(targetWidth, targetHeight, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d = resizedImage.createGraphics();
        
        // 이미지 품질 개선을 위한 렌더링 힌트 설정
        g2d.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BICUBIC);
        g2d.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        
        g2d.drawImage(originalImage, 0, 0, targetWidth, targetHeight, null);
        g2d.dispose();
        
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write(resizedImage, "jpg", baos);
        return baos.toByteArray();
    }
}