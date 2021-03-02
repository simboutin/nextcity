const changeNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-transparent');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= (navbar.scrollHeight * 2)) {
        navbar.classList.add('navbar-purple');
      } else {
        navbar.classList.remove('navbar-purple');
      }
    });
  }
}

export { changeNavbarOnScroll };