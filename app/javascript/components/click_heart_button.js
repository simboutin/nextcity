const clickHeartButton = () => {
  $(function() {
    $(".heart").on("click", function() {
      $(this).toggleClass("is-active");
    });
  });
};

export { clickHeartButton };
