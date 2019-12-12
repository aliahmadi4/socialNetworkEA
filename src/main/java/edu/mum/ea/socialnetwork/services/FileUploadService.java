package edu.mum.ea.socialnetwork.services;

import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Path;
import java.util.stream.Stream;

public interface FileUploadService {
    String saveImage(MultipartFile file) throws Exception;
}