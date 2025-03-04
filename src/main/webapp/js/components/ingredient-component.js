$(document).ready(function () {
  // 상품 목록 관리를 위한 공통 모듈
  const IngredientManager = {
    // 상품 목록 새로고침 - 모든 필터에서 공통으로 사용
    refreshProductList(url) {
      const $container = $(".products-ing-content");
      $container.addClass("loading");

      return $.ajax({
        url: url,
        method: "GET",
        beforeSend: () => {
          $container.addClass("loading-state");
        },
        success: (response) => {
          const $temp = $("<div>").html(response);

          // 상품 목록 업데이트
          $container.replaceWith($temp.find(".products-ing-content"));

          // 페이지네이션 업데이트
          const $newPagination = $temp.find(".pagination-container");
          if ($newPagination.length) {
            $(".pagination-container").replaceWith($newPagination);
          }

          // URL 업데이트
          history.pushState({}, "", url);
        },
        error: (xhr, status, error) => {
          console.error("상품 목록 로딩 실패:", error);
          this.showError("상품 목록을 불러오는데 실패했습니다.");
        },
        complete: () => {
          $container.removeClass("loading-state");
        },
      });
    },

    // 에러 메시지 표시
    showError(message) {
      const errorHtml = `
          <div class="alert alert-danger alert-dismissible fade show" role="alert">
              ${message}
              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
          </div>
      `;
      $(".products-ing-content").prepend(errorHtml);
    },
  };

  const PageTitleManager = {
    DEFAULT_TITLE: "전체 상품",

    init() {
      // DOM이 완전히 로드된 후 실행
      this.updatePageTitle();
    },

    getPageTitle() {
      // URL 경로와 파라미터 파싱
      const pathSegments = window.location.pathname.split("/");
      const lastSegment = pathSegments[pathSegments.length - 1];
      const urlParams = new URLSearchParams(window.location.search);

      // URL 파라미터 추출
      const keyword = urlParams.get("keyword");
      const main = urlParams.get("main");
      const sub = urlParams.get("sub");
      const detail = urlParams.get("detail");

      // 페이지 유형에 따른 제목 결정
      switch (lastSegment) {
        case "seasonly":
          return "제철 식재료";
        case "best":
          return "베스트 식재료 TOP 12";
        case "discount":
          return "할인";
        case "category":
          // 카테고리 계층 구조에 따른 제목 생성
          if (detail) return `${main} > ${sub} > ${detail}`;
          if (sub) return `${main} > ${sub}`;
          if (main) return main;
          return "전체 카테고리";
        default:
          // 검색 결과 페이지 처리
          if (keyword) return `"${keyword}"에 대한 검색 결과`;
          return this.DEFAULT_TITLE;
      }
    },

    updatePageTitle() {
      // 페이지 제목 요소 찾기
      const titleElement = document.getElementById("page-title");
      const pageTitle = this.getPageTitle();

      // 제목 업데이트
      if (titleElement) {
        titleElement.textContent = pageTitle;
        // 브라우저 탭의 제목도 함께 업데이트
        document.title = `${pageTitle} - ReciPICK`;
      }
    },
  };

  // 정렬 기능 관리 모듈
  const IngredientSorter = {
    init() {
      this.attachSortButtonListeners();
      this.highlightCurrentSort();
    },

    // 정렬 버튼 이벤트 리스너 추가
    attachSortButtonListeners() {
      // 이벤트 위임 사용 및 네임스페이스 추가하여 이벤트 관리 용이하게
      $(document)
        .off("click.sort")
        .on("click.sort", ".sort-btn", (e) => {
          e.preventDefault();
          const sortType = $(e.currentTarget).data("sort");
          this.updateSort(sortType);
        });
    },

    updateSort(sortType) {
      const currentUrl = new URL(window.location.href);
      currentUrl.searchParams.set("sortType", sortType);
      currentUrl.searchParams.set("page", "1");

      IngredientManager.refreshProductList(currentUrl.toString()).then(() =>
        this.highlightCurrentSort()
      );
    },

    refreshProductList(url) {
      const $container = $(".products-ing-content");
      $container.addClass("loading");

      $.ajax({
        url: url,
        method: "GET",
        success: (response) => {
          const $temp = $("<div>").html(response);
          $container.replaceWith($temp.find(".products-ing-content"));
          $(".pagination-container").replaceWith(
            $temp.find(".pagination-container")
          );
          history.pushState({}, "", url);
          this.highlightCurrentSort();
        },
        complete: () => {
          $container.removeClass("loading");
        },
      });
    },

    updateUrl(url) {
      history.pushState({}, "", url.toString());
    },

    // 현재 선택된 정렬 버튼 하이라이트
    highlightCurrentSort() {
      const currentSort =
        new URLSearchParams(window.location.search).get("sortType") || "newest";
      $(".sort-btn").removeClass("active");
      $(`.sort-btn[data-sort="${currentSort}"]`).addClass("active");
    },
  };

  const CategoryFilter = {
    init() {
      this.bindEvents();
      this.restoreState();
    },

    bindEvents() {
      // 체크박스 변경 이벤트 처리
      $(document).on("change", ".category-checkbox", (e) => {
        console.log("체크박스 변경 감지:", e.target.checked);
        this.handleCategoryChange();
      });
      // 아코디언 메뉴 클릭 이벤트 (옵션)
      $(document).on("click", ".category-link", (e) => {
        e.preventDefault(); // 아코디언 상태 보존 로직 추가 가능
      });
    },

    handleCategoryChange() {
      const selectedCategories = this.getSelectedCategories();
      console.log("선택된 카테고리:", selectedCategories); // 디버깅
      const currentUrl = new URL(window.location.href);
      console.log("현재 URL:", currentUrl.toString()); // 디버깅

      // 기존 카테고리 파라미터를 모두 제거합니다
      currentUrl.searchParams.delete("selectedCategories");

      // 선택된 카테고리가 있다면 URL 파라미터로 추가합니다
      selectedCategories.forEach((category) => {
        currentUrl.searchParams.append("selectedCategories", category);
      });

      // 페이지를 1로 초기화합니다
      currentUrl.searchParams.set("page", "1");

      // 상품 목록을 새로고침합니다
      IngredientManager.refreshProductList(currentUrl.toString()).then(() =>
        this.restoreState()
      );
    },

    // 카테고리 필터 관련 함수 수정
    // getSelectedCategories() {
    //   const categories = [];
    //   $(".category-checkbox:checked").each(function () {
    //     const checkbox = $(this);
    //     const category = {
    //       main: checkbox.data("main"),
    //       sub: checkbox.data("sub"),
    //       detail: checkbox.data("detail"),
    //     };
    //     // 카테고리 데이터가 모두 존재하는 경우만 추가
    //     if (category.main && category.sub && category.detail) {
    //       categories.push(
    //         `${category.main},${category.sub},${category.detail}`
    //       );
    //     }
    //   });
    //   return categories;
    // },

    getSelectedCategories() {
      const categories = [];
      $(".category-checkbox:checked").each(function () {
        const checkbox = $(this);
        // 값이 없는 경우 빈 문자열로 대체
        const main = checkbox.data("main") || "";
        const sub = checkbox.data("sub") || "";
        const detail = checkbox.data("detail") || "";

        // 최소한 하나의 값이라도 있으면 추가
        if (main || sub || detail) {
          // 디버깅용 로그
          console.log("체크박스 데이터:", { main, sub, detail });
          categories.push(`${main},${sub},${detail}`);
        }
      });

      // 디버깅용 로그
      console.log("수집된 카테고리:", categories);
      return categories;
    },

    updateProductList(selectedCategories) {
      const currentUrl = new URL(window.location.href); // 현재 페이지 번호와 정렬 상태 유지
      const currentPage = currentUrl.searchParams.get("page") || "1";
      const currentSort = currentUrl.searchParams.get("sortType") || "newest"; // 기존 카테고리 파라미터만 제거하고 다른 파라미터는 유지
      currentUrl.searchParams.delete("selectedCategories"); // 선택된 카테고리 추가
      selectedCategories.forEach((category) => {
        currentUrl.searchParams.append("selectedCategories", category);
      });

      $.ajax({
        url: currentUrl.toString(),
        method: "GET",
        beforeSend: () => {
          $(".products-ing-content").addClass("loading-state");
        },
        success: (response) => {
          const $temp = $("<div>").html(response); // 상품 목록과 페이징 업데이트
          $(".products-ing-content").replaceWith(
            $temp.find(".products-ing-content")
          );
          $(".pagination-container").replaceWith(
            $temp.find(".pagination-container")
          );
          // URL 업데이트
          history.pushState({}, "", currentUrl.toString()); // 체크박스 상태 복원
          this.restoreState();
        },
        error: (xhr, status, error) => {
          console.error("상품 목록 로딩 실패:", error);
          this.showError("상품 목록을 불러오는데 실패했습니다.");
        },
        complete: () => {
          $(".products-ing-content").removeClass("loading-state");
        },
      });
    },

    restoreState() {
      const params = new URLSearchParams(window.location.search);
      const categories = params.getAll("selectedCategories");
      // 체크박스 초기화
      $(".category-checkbox").prop("checked", false);
      // 선택된 카테고리 복원
      categories.forEach((category) => {
        const [main, sub, detail] = category.split(",");
        const selector = `.category-checkbox[data-main="${main}"][data-sub="${sub}"][data-detail="${detail}"]`;
        const $checkbox = $(selector);
        if ($checkbox.length) {
          $checkbox.prop("checked", true); // 해당 체크박스의 부모 아코디언 패널 열기
          $checkbox.closest(".accordion-collapse").addClass("show");
        }
      });
    },

    // 에러 표시 메서드
    showError(message) {
      const errorHtml = `<div class="alert alert-danger alert-dismissible fade show" role="alert">
      ${message}
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>`;
      $(".products-ing-content").prepend(errorHtml);
    },
  };

  const PriceFilter = {
    init() {
      this.bindEvents();
      this.restoreState();
    },

    bindEvents() {
      console.log("바인딩 시작"); // 디버깅용
      $(document).on("click", ".price-range-btn", (e) => {
        console.log("버튼 클릭됨"); // 디버깅용
        const $btn = $(e.currentTarget);
        $(".price-range-btn").removeClass("active");
        $btn.addClass("active");

        const minPrice = $btn.data("min");
        const maxPrice = $btn.data("max");
        this.applyPriceFilter(minPrice, maxPrice);
      });

      // 적용 버튼 이벤트 - 수정된 부분
      $("#applyPriceRange").on("click", () => {
        console.log("적용 버튼 클릭됨"); // 디버깅용 로그

        const minPrice = $("#minPriceInput").val();
        const maxPrice = $("#maxPriceInput").val();

        console.log("입력된 가격:", { minPrice, maxPrice }); // 값 확인용 로그

        // 입력값 검증
        if (!minPrice && !maxPrice) {
          alert("최소 가격 또는 최대 가격을 입력해주세요.");
          return;
        }

        // 가격 범위 검증
        if (minPrice && maxPrice && parseInt(minPrice) > parseInt(maxPrice)) {
          alert("최소 가격이 최대 가격보다 큽니다.");
          return;
        }

        // 버튼 선택 해제
        $(".price-range-btn").removeClass("active");

        // 필터 적용
        this.applyPriceFilter(minPrice || 0, maxPrice || 0);
      });
    },

    applyPriceFilter(minPrice, maxPrice) {
      const currentUrl = new URL(window.location.href);

      // 가격이 0이거나 빈 값이면 해당 파라미터 제거
      if (minPrice && minPrice > 0) {
        currentUrl.searchParams.set("minPrice", minPrice);
      } else {
        currentUrl.searchParams.delete("minPrice");
      }

      if (maxPrice && maxPrice > 0) {
        currentUrl.searchParams.set("maxPrice", maxPrice);
      } else {
        currentUrl.searchParams.delete("maxPrice");
      }

      // 페이지 초기화
      currentUrl.searchParams.set("page", "1");

      // 상품 목록 새로고침
      IngredientManager.refreshProductList(currentUrl.toString())
        .then(() => this.restoreState())
        .catch((error) => {
          console.error("가격 필터 적용 실패:", error);
          alert("가격 필터 적용 중 오류가 발생했습니다.");
        });
    },

    restoreState() {
      const params = new URLSearchParams(window.location.search);
      const minPrice = params.get("minPrice");
      const maxPrice = params.get("maxPrice");

      // 입력 필드 값 복원
      if (minPrice) $("#minPriceInput").val(minPrice);
      if (maxPrice) $("#maxPriceInput").val(maxPrice);

      // 버튼 상태 복원
      $(".price-range-btn").removeClass("active");
      if (minPrice || maxPrice) {
        $(
          `.price-range-btn[data-min="${minPrice}"][data-max="${maxPrice}"]`
        ).addClass("active");
      }
    },

    // applyPriceFilter(minPrice, maxPrice) {
    //   const currentUrl = new URL(window.location.href);

    //   if (minPrice) currentUrl.searchParams.set("minPrice", minPrice);
    //   else currentUrl.searchParams.delete("minPrice");

    //   if (maxPrice) currentUrl.searchParams.set("maxPrice", maxPrice);
    //   else currentUrl.searchParams.delete("maxPrice");

    //   currentUrl.searchParams.set("page", "1");

    //   IngredientManager.refreshProductList(currentUrl.toString()).then(() =>
    //     this.restoreState()
    //   );
    // },

    refreshProductList(url) {
      console.log("상품 목록 갱신 요청:", url); // 디버깅용 로그

      $(".products-ing-content").addClass("loading-state");

      $.ajax({
        url: url,
        method: "GET",
        success: (response) => {
          console.log("서버 응답 성공"); // 디버깅용 로그
          const $temp = $("<div>").html(response);
          $(".products-ing-content").replaceWith(
            $temp.find(".products-ing-content")
          );
          $(".pagination-container").replaceWith(
            $temp.find(".pagination-container")
          );
          history.pushState({}, "", url);
        },
        error: (xhr, status, error) => {
          console.error("상품 목록 로딩 실패:", error);
          console.error("상태:", status);
          console.error("응답:", xhr.responseText);
          alert("상품 목록을 불러오는데 실패했습니다. 다시 시도해주세요.");
        },
        complete: () => {
          $(".products-ing-content").removeClass("loading-state");
        },
      });
    },

    // restoreState() {
    //   const params = new URLSearchParams(window.location.search);
    //   const minPrice = params.get("minPrice");
    //   const maxPrice = params.get("maxPrice");

    //   if (minPrice || maxPrice) {
    //     $("#minPriceInput").val(minPrice);
    //     $("#maxPriceInput").val(maxPrice);
    //     $(
    //       `.price-range-btn[data-min="${minPrice}"][data-max="${maxPrice}"]`
    //     ).addClass("active");
    //   }
    // },
  };

  // 모든 모듈 초기화
  function initialize() {
    window.IngredientManager = IngredientManager;
    PageTitleManager.init(); // 가장 먼저 실행
    IngredientSorter.init();
    CategoryFilter.init();
    PriceFilter.init();
  }

  initialize();
});
