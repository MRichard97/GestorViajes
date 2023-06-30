export const loginUser = async(req, res) => {
    return res.render("auth/login", {
        page: "Login"
    });
}

export const redirectLoginUser = async(req, res) => {
    res.redirect('/login');
}