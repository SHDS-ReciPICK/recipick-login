$(document).ready(function () {
  // 상품 목록 관리를 위한 공통 모듈
  const ProductManager = {
    // 상품 목록 새로고침 - 모든 필터에서 공통으로 사용
    refreshProductList(url) {
      const $container = $(".products-content");
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
          $container.replaceWith($temp.find(".products-content"));

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
      $(".products-content").prepend(errorHtml);
    },
  };

  // 페이지 제목 동적 변경
  const PageTitleManager = {
    DEFAULT_TITLE: "전체 상품",

    init() {
      this.updatePageTitle();
    },

    getPageTitle() {
      // URL 경로의 마지막 부분 가져오기 (예: monthly, best 등)
      const pathSegments = window.location.pathname.split("/");
      const lastSegment = pathSegments[pathSegments.length - 1]; // URL 파라미터 추출
      const urlParams = new URLSearchParams(window.location.search);
      const keyword = urlParams.get("keyword");
      const main = urlParams.get("main");
      const sub = urlParams.get("sub");
      const detail = urlParams.get("detail"); // URL 패턴에 따라 적절한 제목 반환

      switch (lastSegment) {
        case "monthly":
          return "이달의 레시피";
        case "best":
          return "베스트 레시피 TOP 12";
        case "discount":
          return "할인";
        case "category": // 카테고리 계층 구조에 따른 제목 생성
          if (detail) return `${main} > ${sub} > ${detail}`;
          if (sub) return `${main} > ${sub}`;
          if (main) return main;
          return "전체 카테고리";
        default:
          if (keyword) return `"${keyword}"에 대한 검색 결과`;
          return this.DEFAULT_TITLE;
      }
    },

    updatePageTitle() {
      const titleElement = document.getElementById("page-title");
      const pageTitle = this.getPageTitle();
      if (titleElement) {
        titleElement.textContent = pageTitle;
        document.title = `${pageTitle} - ReciPICK`;
      }
    },
  };

  // 정렬 기능
  const RecipeSorter = {
    init() {
      this.attachSortButtonListeners();
      this.highlightCurrentSort();
    },

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

      ProductManager.refreshProductList(currentUrl.toString()).then(() =>
        this.highlightCurrentSort()
      );
    },

    refreshProductList(url) {
      const $container = $(".products-content");
      $container.addClass("loading");

      $.ajax({
        url: url,
        method: "GET",
        success: (response) => {
          const $temp = $("<div>").html(response);
          $container.replaceWith($temp.find(".products-content"));
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

    highlightCurrentSort() {
      const currentSort =
        new URLSearchParams(window.location.search).get("sortType") ||
        "popular";
      $(".sort-btn").removeClass("active");
      $(`.sort-btn[data-sort="${currentSort}"]`).addClass("active");
    },
  };

  // 태그 검색
  // const TagManager = {
  //   init() {
  //     // 태그를 저장할 배열
  //     let tags = []; // input 요소와 태그 목록을 가져오기
  //     const input = document.getElementById("tag-input");
  //     const tagsList = document.getElementById("tags-list"); // 태그 입력 처리 (기존 코드와 동일)
  //     input.addEventListener("keyup", function (event) {
  //       if (event.key === "Enter" && input.value.trim() !== "") {
  //         const tag = input.value.trim(); // 이미 존재하는 태그가 아니면 추가
  //         if (!tags.includes(tag)) {
  //           tags.push(tag); // 태그 표시
  //           const tagElement = document.createElement("span");
  //           tagElement.classList.add("badge", "badge-custom", "mr-2", "mb-2");
  //           tagElement.textContent = tag; // 태그 삭제 버튼 추가
  //           const removeBtn = document.createElement("button");
  //           removeBtn.classList.add("btn-close");
  //           removeBtn.textContent = "×"; // "X" 문자 추가
  //           removeBtn.onclick = function () {
  //             tags = tags.filter((t) => t !== tag);
  //             tagElement.remove();
  //           };
  //           tagElement.appendChild(removeBtn);
  //           tagsList.appendChild(tagElement);
  //         } // 입력 필드 비우기
  //         input.value = "";
  //       }
  //     });
  //   },
  // };

  // 필터링 - 카테고리
  const CategoryFilter = {
    init() {
      this.bindEvents();
      this.restoreState(); // URL에서 상태 복원
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
      console.log("현재 URL:", currentUrl.toString()); // 추가

      currentUrl.searchParams.delete("selectedCategories");
      selectedCategories.forEach((category) => {
        currentUrl.searchParams.append("selectedCategories", category);
      });
      currentUrl.searchParams.set("page", "1");

      ProductManager.refreshProductList(currentUrl.toString()).then(() =>
        this.restoreState()
      );
    },

    getSelectedCategories() {
      const categories = [];
      $(".category-checkbox:checked").each(function () {
        const checkbox = $(this);
        const category = {
          main: checkbox.data("main"),
          sub: checkbox.data("sub"),
          detail: checkbox.data("detail"),
        };
        // 카테고리 데이터가 모두 존재하는 경우만 추가
        if (category.main && category.sub && category.detail) {
          categories.push(
            `${category.main},${category.sub},${category.detail}`
          );
        }
      });
      return categories;
    },

    updateProductList(selectedCategories) {
      const currentUrl = new URL(window.location.href); // 현재 페이지 번호와 정렬 상태 유지
      const currentPage = currentUrl.searchParams.get("page") || "1";
      const currentSort = currentUrl.searchParams.get("sortType") || "popular"; // 기존 카테고리 파라미터만 제거하고 다른 파라미터는 유지
      currentUrl.searchParams.delete("selectedCategories"); // 선택된 카테고리 추가
      selectedCategories.forEach((category) => {
        currentUrl.searchParams.append("selectedCategories", category);
      });

      $.ajax({
        url: currentUrl.toString(),
        method: "GET",
        beforeSend: () => {
          $(".products-content").addClass("loading-state");
        },
        success: (response) => {
          const $temp = $("<div>").html(response); // 상품 목록과 페이징 업데이트
          $(".products-content").replaceWith($temp.find(".products-content"));
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
          $(".products-content").removeClass("loading-state");
        },
      });
    },

    restoreState() {
      // URL에서 선택된 카테고리 가져오기
      const params = new URLSearchParams(window.location.search);
      const categories = params.getAll("selectedCategories"); // 모든 체크박스 초기화
      $(".category-checkbox").prop("checked", false); // 선택된 카테고리에 해당하는 체크박스 체크
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
      $(".products-content").prepend(errorHtml);
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

      if (minPrice) currentUrl.searchParams.set("minPrice", minPrice);
      else currentUrl.searchParams.delete("minPrice");

      if (maxPrice) currentUrl.searchParams.set("maxPrice", maxPrice);
      else currentUrl.searchParams.delete("maxPrice");

      currentUrl.searchParams.set("page", "1");

      ProductManager.refreshProductList(currentUrl.toString()).then(() =>
        this.restoreState()
      );
    },

    refreshProductList(url) {
      console.log("상품 목록 갱신 요청:", url); // 디버깅용 로그

      $(".products-content").addClass("loading-state");

      $.ajax({
        url: url,
        method: "GET",
        success: (response) => {
          console.log("서버 응답 성공"); // 디버깅용 로그
          const $temp = $("<div>").html(response);
          $(".products-content").replaceWith($temp.find(".products-content"));
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
          $(".products-content").removeClass("loading-state");
        },
      });
    },

    restoreState() {
      const params = new URLSearchParams(window.location.search);
      const minPrice = params.get("minPrice");
      const maxPrice = params.get("maxPrice");

      if (minPrice || maxPrice) {
        $("#minPriceInput").val(minPrice);
        $("#maxPriceInput").val(maxPrice);
        $(
          `.price-range-btn[data-min="${minPrice}"][data-max="${maxPrice}"]`
        ).addClass("active");
      }
    },
  };

  // 필터링 - 평점
  const RatingFilter = {
    // 모듈 초기화
    init() {
      this.bindEvents();
      this.restoreState();
    },

    // 이벤트 바인딩
    bindEvents() {
      // 평점 체크박스 변경 이벤트 처리
      $(document).on("change", ".rating-checkbox", (e) => {
        this.handleRatingChange();
      });
    },

    // 평점 변경 처리
    handleRatingChange() {
      const selectedRatings = this.getSelectedRatings();
      const currentUrl = new URL(window.location.href);

      currentUrl.searchParams.delete("ratings");
      selectedRatings.forEach((rating) => {
        currentUrl.searchParams.append("ratings", rating);
      });
      currentUrl.searchParams.set("page", "1");

      ProductManager.refreshProductList(currentUrl.toString()).then(() =>
        this.restoreState()
      );
    },

    // 선택된 평점 가져오기
    getSelectedRatings() {
      return $(".rating-checkbox:checked")
        .map(function () {
          return $(this).data("rating");
        })
        .get();
    },

    // 상품 목록 새로고침
    refreshProductList(url) {
      const $container = $(".products-content");
      $container.addClass("loading");

      $.ajax({
        url: url,
        method: "GET",
        success: (response) => {
          const $temp = $("<div>").html(response);
          $container.replaceWith($temp.find(".products-content"));
          $(".pagination-container").replaceWith(
            $temp.find(".pagination-container")
          );
          // URL 업데이트
          history.pushState({}, "", url);
          // 필터 상태 복원
          this.restoreState();
        },
        error: (xhr, status, error) => {
          console.error("상품 목록 로딩 실패:", error);
        },
        complete: () => {
          $container.removeClass("loading");
        },
      });
    },

    // 필터 상태 복원
    restoreState() {
      const params = new URLSearchParams(window.location.search);
      const ratings = params.getAll("ratings");

      // 모든 체크박스 초기화
      $(".rating-checkbox").prop("checked", false);

      // URL에 있는 평점들 체크
      ratings.forEach((rating) => {
        $(`.rating-checkbox[data-rating="${rating}"]`).prop("checked", true);
      });
    },
  };

  function initialize() {
    window.ProductManager = ProductManager;
    PageTitleManager.init();
    // TagManager.init();
    RecipeSorter.init();
    CategoryFilter.init();
    PriceFilter.init();
    RatingFilter.init();
  }

  // 실행
  initialize();
});
