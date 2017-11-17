package com.delip.util;

import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;

import lombok.extern.java.Log;

@Log
public class UploadFileUtils {
//	private static final Logger logger = 
//			LoggerFactory.getLogger(UploadFileUtils.class);
	
    public static String makeThumbnail(String fileName) throws Exception {
        BufferedImage sourceImg =
                 ImageIO.read(new File("C:\\zzz\\", fileName));
        BufferedImage destImg =
                 Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
        //s_를 붙이는 이유는 얘가 썸네일인지 아닌지 구분해야하기 떄문에 s_로 시작하면 썸네일, 없으면 일반 파일
        String thumbnailName =
                 "C:\\zzz\\" + File.separator + "s_" + fileName;
        
        File newFile = new File(thumbnailName);  //
        String formatName =
                 fileName.substring(fileName.lastIndexOf(".") + 1);
        ImageIO.write(destImg, formatName.toUpperCase(), newFile);
        
        log.info(thumbnailName);
        return thumbnailName;
   }


}
