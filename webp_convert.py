from PIL import Image
import os

def convert_to_webp(input_folder, output_folder):
    # Create output folder if it doesn't exist
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)
    
    # Get a list of all files in the input folder
    files = os.listdir(input_folder)
    
    for file in files:
        input_path = os.path.join(input_folder, file)
        
        # Open the image file
        img = Image.open(input_path)
        
        # Convert the image to WebP format
        output_path = os.path.join(output_folder, os.path.splitext(file)[0] + ".webp")
        img.save(output_path, "WEBP")
        
        print(f"Converted {input_path} to WebP format")

if __name__ == "__main__":
    input_folder = input("Enter the path to the folder containing PNG/JPG images: ")
    output_folder = input("Enter the path to the output folder: ")
    
    convert_to_webp(input_folder, output_folder)
