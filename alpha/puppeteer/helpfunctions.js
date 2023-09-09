
async function delay(milliseconds) {
    new Promise((resolve) => setTimeout(resolve, milliseconds));
}


String.prototype.cleanup = function () {
    return this.toLowerCase().replace(/[^a-zA-Z0-9]+/g, "-");
}


String.prototype.removebaseurl = function () {
    return this.replace("https-app-intigriti-com-researcher-program-redirect-", "");
}


function createDir(dir) {
    if (fs.existsSync(dir)) {
        fs.rmSync(dir, { recursive: true, force: true });
    }
    fs.mkdirSync(dir);
}

const http = require("http");

function checkURL(url) {
    return new Promise((resolve, reject) => {
        http.get(url, (res) => {
            if (res.statusCode >= 200 && res.statusCode < 300) {
                // URL is valid
                resolve(true);
            } else {
                // URL is invalid
                resolve(false);
            }
        }).on("error", (err) => {
            // There was an error sending the request
            reject(err);
        });
    });
}
