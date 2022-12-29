const puppeteer = require('puppeteer');
const fs = require('fs');


var dir = 'urls';
if (fs.existsSync(dir)) {
    fs.rmSync(dir, { recursive: true, force: true });
}

fs.mkdirSync(dir);

let browser

async function run() {
    const browser = await puppeteer.launch();
    const page = await browser.newPage();



    await page.goto('https://login.intigriti.com/account/login');
    await page.type('#Input_Email', 'thor.demeestere@telenet.be');
    await page.evaluate(() => { document.querySelector("form").submit(); });
    await page.waitForNavigation();
    await page.type('#Input_Password', '8E.WW5.r5wDhzY9');
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
            getScreenshot(browser, url);
        }

        await page.evaluate(() => { document.querySelector(".pages+.fast-page-navigation .page-skipper").click() });

    }

    // await browser.close();
}



async function getScreenshot(browser, url) {
    const page = await browser.newPage();



    await page.goto(url);
    await page.waitForNavigation();
    await delay(10000);

    const domains = await page.evaluate(() => {
        let domains = ""
        document.querySelectorAll(".domainSpecification .domain p")
            .forEach(domain => domains += `${domain.textContent.trim()}\n`)
        return domains;
    });

    fs.writeFileSync(`urls/${url.cleanup().removebaseurl()}.txt`, domains);

    // const screenshot = await page.screenshot({ path: `images/${url.cleanup()}.png` });
    // return screenshot;
}

run();
// await page.screenshot({ path: 'test.png' });



const delay = (milliseconds) => new Promise((resolve) => setTimeout(resolve, milliseconds));


String.prototype.cleanup = function () {
    return this.toLowerCase().replace(/[^a-zA-Z0-9]+/g, "-");
}


String.prototype.removebaseurl = function () {
    return this.replace("https-app-intigriti-com-researcher-program-redirect-", "");
}

