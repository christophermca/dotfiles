const toggleLumenance = "toggle-lumin";

const toggle = () => {
  if (document.body.classList.contains(toggleLumenance)) {
    document.body.classList.remove(toggleLumenance);
  } else {
    document.body.classList.add(toggleLumenance);
  }
};

window.toggleLumenance = () => {
  if (document.body.classList.length) {
    toggle();
  } else {
    document.body.className = toggleLumenance;
  }
};
