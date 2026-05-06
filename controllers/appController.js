exports.home = (req, res) => {
    res.send('DevSecOps Pipeline Running 🚀');
};

exports.health = (req, res) => {
    res.json({ status: "OK" });
};