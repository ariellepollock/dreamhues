import os
import requests
from dotenv import load_dotenv
load_dotenv()

def get_imgix_palette(image_url):
    palette_api_url = "https://api.imgix.com/v1/palette"
    imgix_api_key = os.environ.get('IMGIX_API_KEY')

    headers = {
        'Authorization': f'Bearer {imgix_api_key}',
    }
    data = {
        'url': '49608b.JPG',
    }

    try:
        response = requests.post(palette_api_url, headers=headers, data=data)
        # Check if request was successful
        if response.status_code == 200:
            # Parse response
            palette_data = response.json()
            # Extract palette
            palette = palette_data.get('palette', [])
            return palette
        else:
            print(f'Imgix API Error: {response.status_code} - {response.text}')
    except Exception as e:
        # Print an error message for debugging
        print(f'Imgix API Exception: {e}')
        return None