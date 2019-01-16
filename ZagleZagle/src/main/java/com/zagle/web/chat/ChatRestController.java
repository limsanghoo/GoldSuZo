package com.zagle.web.chat;

import java.io.File;
import java.util.Iterator;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@RestController
@RequestMapping("/chat/*")
public class ChatRestController {
	private String fileName;

	public ChatRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}

	@RequestMapping(value="json/uploadFile/",method=RequestMethod.POST)
	public String uploadFile(MultipartHttpServletRequest multipartFile) throws Exception{
		String path = "C:\\Users\\Bit\\git\\GoldSuZo\\ZagleZagle\\WebContent\\common\\images\\chat\\";
		System.out.println("파일업로드하는곳");
//		Chat chat = new Chat();
//		File file = new File(temDir, multipartFile.getOriginalFilename());
//		multipartFile.transferTo(file);
//		chat.setImageFile(multipartFile.getOriginalFilename());
		
        File dir = new File(path);
        if(!dir.isDirectory()){
            dir.mkdir();
        }
        Iterator<String> files = multipartFile.getFileNames();
        System.out.println(files.hasNext());
        while(files.hasNext()){
            String uploadFile = files.next();
            MultipartFile mFile = multipartFile.getFile(uploadFile);
            String fileName = mFile.getOriginalFilename();
            System.out.println("실제 파일 이름 : " +fileName);
           
            try {
                mFile.transferTo(new File(path,fileName));
               
            } catch (Exception e) {
                e.printStackTrace();
            }finally {
				this.fileName = fileName;
			}
        }
        return fileName;
	}
}
