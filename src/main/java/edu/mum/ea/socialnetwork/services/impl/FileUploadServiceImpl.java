package edu.mum.ea.socialnetwork.services.impl;

import edu.mum.ea.socialnetwork.services.FileUploadService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Service
public class FileUploadServiceImpl implements FileUploadService {

    private static String uploadDirectory = System.getProperty("user.dir") + "/src/main/webapp/media/post/";

    @Override
    public String saveImage(MultipartFile file) throws Exception {

//      Create a folder
        File directory = new File(uploadDirectory);
        if (!directory.exists()) {
            directory.mkdirs();
        }


        byte[] bytes = file.getBytes();
        Path path = Paths.get(uploadDirectory + file.getOriginalFilename());
        Files.write(path, bytes);
        return file.getOriginalFilename();
    }
}
