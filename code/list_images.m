function imgNames = list_images(img_dir)
    
    imgList = dir(img_dir);
    imgNames = {imgList(~cellfun(@isempty,regexpi({imgList.name},'.*(\.raw)'))).name}';
    
 
    
end