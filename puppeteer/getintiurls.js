require('dotenv').config()
const puppeteer = require('puppeteer');
const fs = require('fs');

createDir('urls');


let browser

async function run() {
    const browser = await puppeteer.launch();
    const page = await browser.newPage();



    await page.goto('https://login.intigriti.com/account/login');
    await page.type('#Input_Email', process.env.INTIGRITI_USERNAME);
    await page.evaluate(() => { document.querySelector("form").submit(); });
    await page.waitForNavigation();
    await page.type('#Input_Password', process.env.INTIGRITI_PASSWORD);
    await page.evaluate(() => { document.querySelector("form").submit(); });
    await page.waitForNavigation();
    await page.waitForNavigation();




    await page.goto('https://app.intigriti.com/researcher/programs');

    await page.waitForNavigation();


    // const pages = await page.evaluate(() => {
    //     return document.querySelectorAll('.pages div').length;
    // });

    const pages = "7";

    for (x = 0; x < parseInt(pages); x++) {
        await delay(10000);


        const links = await page.evaluate(() => {
            const anchors = Array.from(document.querySelectorAll(".program-name"));
            return anchors.map(a => a.href);
        });
        for (const url of links) {
            parseUrls(browser, url);
        }

        await page.evaluate(() => { document.querySelector(".pages+.fast-page-navigation .page-skipper").click() });

    }

    // await browser.close();
}



async function parseUrls(browser, url) {
    const page = await browser.newPage();



    await page.goto(url);
    await page.waitForNavigation();
    await delay(10000);

    const domains = await page.evaluate(() => {
        let domains = ""
        document.querySelectorAll(".domainSpecification .domain p")
            .forEach(function (domain) {
                if (domain.textContent.includes(".") && !domain.textContent.includes("(") && !domain.textContent.includes(")")) {
                    domains += `${domain.textContent.trim().replace(/^https?:\/\//, "")}\n`;
                }
            });
        return domains;
    });

    if (domains.length > 0) {
        fs.writeFileSync(`urls/${url.cleanup().removebaseurl()}.txt`, domains);
    }

    page.close();
}

run();



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

