import requests
from bs4 import BeautifulSoup

# List of URLs to check
urls = []
with open('filename.txt', 'r') as f:
    for line in f:
        urls.append(line.strip())

def has_post_message(url):
    try:
        # Send an HTTP GET request to the URL
        response = requests.get(url)

        # Check if the request was successful
        if response.status_code == 200:
            # Parse the HTML content of the page
            soup = BeautifulSoup(response.content, 'html.parser')

            # Search for JavaScript code that uses PostMessage
            script_tags = soup.find_all('script')
            for script_tag in script_tags:
                script_content = script_tag.get_text()
                if 'message' in script_content:
                    return True

        return False

    except Exception as e:
        print(f"Error checking {url}: {str(e)}")
        return False

# Iterate through the list of URLs and check if they have PostMessage
for url in urls:
    if has_post_message(url):
        print(f'{url} has PostMessage functionality.')
    else:
        print(f'{url} does not have PostMessage functionality.')
