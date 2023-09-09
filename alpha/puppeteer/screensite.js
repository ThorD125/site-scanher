const puppeteer = require('puppeteer');
const fs = require('fs');
const yargs = require('yargs');

// const url = process.argv.slice(2)[0];

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
    if (!fs.existsSync(dir)) {
        fs.mkdirSync(dir);
    }
}

function checkURL(url) {
    return "https://" + `${url.replace(/^https?:\/\//, "")}`;
}

const argv = yargs
    .option('url', {
        alias: 'u',
        description: 'Input a URL to screenshot',
        type: 'string'
    })
    .option('output', {
        alias: 'o',
        description: 'Output folder',
        type: 'string'
    })
    .help()
    .alias('help', 'h').argv;

if (argv.url == undefined) {
    console.log("No URL provided");
    process.exit(1);
}

if (argv.output == undefined) {
    argv.output = "./images";
    createDir(argv.output);
}

const url = argv.url;

createDir('images');
const newurl = checkURL(url);

fs.rmSync(`${argv.output}/${newurl.cleanup().replace(/^https?-/g, "")}.png`, { force: true });

async function run(url) {

    const browser = await puppeteer.launch();

    const page = await browser.newPage();
    await page.setViewport({ width: 1280, height: 720 });



    await page.goto(newurl);
    await page.waitForNetworkIdle();


    await page.screenshot({
        path: `${argv.output}/${newurl.cleanup().replace(/^https?-/g, "")}.png`,
        fullPage: true,
    });

    await browser.close();
}

run(url);
