const puppeteer = require('puppeteer');
const fs = require('fs');

const url = process.argv.slice(2)[0];

if (url == undefined) {
    console.log("No URL provided");
    process.exit(1);
}


createDir('images');


async function run(url) {
    const browser = await puppeteer.launch();

    const page = await browser.newPage();
    await page.setViewport({ width: 1280, height: 720 });

    const newurl = checkURL(url);


    await page.goto(newurl);
    await page.waitForNetworkIdle();

    await page.screenshot({
        path: `images/${newurl.cleanup().replace(/^https?-/g, "")}.png`,
        fullPage: true,
    });

    await browser.close();
}

run(url);

async function delay(milliseconds) {
    new Promise((resolve) => setTimeout(resolve, milliseconds));
}


String.prototype.cleanup = function () {
    return this.toLowerCase().replace(/[^a-zA-Z0-9]+/g, "-").replace(/^https?\/\//g, "-");
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

function checkURL(url) {
    return "https://" + `${url.replace(/^https?:\/\//, "")}`;
}
