const wrapper = document.getElementById("wrapper");
const toggleButton = document.getElementById("menu-toggle");

toggleButton.onclick = function () {
    wrapper.classList.toggle("toggled");
};