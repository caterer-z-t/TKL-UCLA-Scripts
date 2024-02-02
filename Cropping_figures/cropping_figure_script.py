
from PIL import Image
import matplotlib.pyplot as plt
import matplotlib.patches as patches

# Task 1: Import the BMP files
file1_path =(
    "/Users/zach/Documents/Education/Undergrad_UWEC/Summer_2023/UCLA/figure_final_paper_creations/figures-final-paper/Octopi-images-23-08-2023/10uM-3HC-0.2ug-RIF/8_2_0_BF_LED_matrix_full.bmp"
)
file2_path = (
    "/Users/zach/Documents/Education/Undergrad_UWEC/Summer_2023/UCLA/figure_final_paper_creations/figures-final-paper/Octopi-images-23-08-2023/10uM-3HC-0.2ug-RIF/8_2_0_Fluorescence_470_nm_Ex.bmp"
)


image1 = Image.open(file1_path)
image2 = Image.open(file2_path)

# Task 2: Manually scan and select cropping area
print("Manually select the cropping area by entering coordinates:")
left = int(1000)
upper = int(1000)
right = int(1333)
lower = int(1333)

# Task 3: Crop both images at the same spot
cropped_image1 = image1.crop((left, upper, right, lower))
cropped_image2 = image2.crop((left, upper, right, lower))

# Task 4: Visualize the cropping area
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(10, 5))

ax1.imshow(image1)
ax1.add_patch(patches.Rectangle((left, upper), right - left, lower - upper, linewidth=2, edgecolor='r', facecolor='none'))
ax1.set_title('Original Image 1')

ax2.imshow(image2)
ax2.add_patch(patches.Rectangle((left, upper), right - left, lower - upper, linewidth=2, edgecolor='r', facecolor='none'))
ax2.set_title('Original Image 2')

plt.tight_layout()
plt.show()

# Task 3: Crop both images at the same spot
cropped_image1 = image1.crop((left, upper, right, lower))
cropped_image2 = image2.crop((left, upper, right, lower))

# Task 4: Visualize the cropped area only
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(10, 5))

ax1.imshow(cropped_image1)
ax1.set_title('Cropped Image 1')

ax2.imshow(cropped_image2)
ax2.set_title('Cropped Image 2')

plt.tight_layout()
plt.show()

# Task 5: Save cropped images as BMP files
cropped1_file_path = file1_path.replace(".bmp", "-cropped-again-for-the-second-time.bmp")
cropped2_file_path = file2_path.replace(".bmp", "-cropped-again-for-the-second-time.bmp")
cropped_image1.save(cropped1_file_path)
cropped_image2.save(cropped2_file_path)

print("Images cropped and saved successfully.")

from PIL import Image, ImageDraw
import matplotlib.pyplot as plt
import matplotlib.patches as patches

# Task 1: Import the TIFF files
file1_path = (
    "/Users/zach/Documents/Education/Undergrad_UWEC/Summer_2023/UCLA/figure_final_paper_creations/figures-final-paper/Analysis-selected/additional_imgae/08172023-imagingrun_60X-100uM-DMN-msmeg_z04_ch01.tif"
)
file2_path = (
    "/Users/zach/Documents/Education/Undergrad_UWEC/Summer_2023/UCLA/figure_final_paper_creations/figures-final-paper/08172023-imagingrun_60X-100uM-DMN-msmeg_z07_ch00.tif"
)

image1 = Image.open(file1_path)
image2 = Image.open(file2_path)

# Task 2: Manually scan and select cropping area
print("Manually select the cropping area by entering coordinates:")
left = int(2500)
right = int(3500)
upper = int(3200)
lower = int(4200)

# Task 3: Crop both images at the same spot
cropped_image1 = image1.crop((left, upper, right, lower))
cropped_image2 = image2.crop((left, upper, right, lower))

# Task 4: Visualize the cropping area
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(10, 5))

ax1.imshow(image1)
ax1.add_patch(patches.Rectangle((left, upper), right - left, lower - upper, linewidth=2, edgecolor='r', facecolor='none'))
ax1.set_title('Original Image 1')

ax2.imshow(image2)
ax2.add_patch(patches.Rectangle((left, upper), right - left, lower - upper, linewidth=2, edgecolor='r', facecolor='none'))
ax2.set_title('Original Image 2')

plt.tight_layout()
plt.show()

# Task 5: Visualize the cropped images
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(10, 5))

ax1.imshow(cropped_image1)
ax1.set_title('Cropped Image 1')

ax2.imshow(cropped_image2)
ax2.set_title('Cropped Image 2')

plt.tight_layout()
plt.show()

# Task 6: Save the cropped images (TIFF format)
cropped1_file_path = file1_path.replace(".tif", "-cropped-again-for-the-second-time.tif")
cropped2_file_path = file2_path.replace(".tif", "-cropped-again-for-the-second-time.tif")
cropped_image1.save(cropped1_file_path)
cropped_image2.save(cropped2_file_path)

print("Images cropped, displayed, and saved successfully.")