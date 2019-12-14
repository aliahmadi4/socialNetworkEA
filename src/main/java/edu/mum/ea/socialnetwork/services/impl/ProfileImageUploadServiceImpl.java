package edu.mum.ea.socialnetwork.services.impl;

import edu.mum.ea.socialnetwork.services.ProfileImageUploadService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;


@Service
public class ProfileImageUploadServiceImpl implements ProfileImageUploadService {

    public static String uploadDirectory = System.getProperty("user.dir") + "/src/main/webapp/media/profile/";
    //    String rootDirectory = req.getSession().getServletContext().getRealPath("/")+"\\media\\post\\";

    @Override
    public String uploadImage(MultipartFile file) {
        // Create a folder
        File directory = new File(uploadDirectory);
        if (!directory.exists()) {
            directory.mkdirs();
        }
        try {

            // Get the file and save it somewhere
            byte[] bytes = file.getBytes();
            Path path = Paths.get(uploadDirectory + file.getOriginalFilename());
            Files.write(path, bytes);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return file.getOriginalFilename();
    }
}
