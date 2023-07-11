package com.bobochang.warehouse.controller;

import com.google.code.kaptcha.Producer;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

@RequestMapping()
@RestController
public class LoginController {

    @Resource(name = "captchaProducer")
    private Producer producer;

    @Resource
    private StringRedisTemplate redisTemplate;

    @GetMapping("/captcha/captchaImage")
    public void captchaImage(HttpServletResponse response) {
        ServletOutputStream out = null;
        try {
            String text = producer.createText();
            BufferedImage image = producer.createImage(text);
            redisTemplate.opsForValue().set(text, "", 60 * 30, TimeUnit.SECONDS);
            response.setContentType("image/jpeg");
            out = response.getOutputStream();
            ImageIO.write(image, "jpg", out);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (out != null) {
                try {
                    out.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
