/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 *
 * @author ACER
 */
public class RecaptchaUtils {

    private static final String SITE_KEY = "6LfHUfwqAAAAAIIFJELg9lqIP9rCM1xx6I5zPGnd";
    private static final String SECRET_KEY = "6LfHUfwqAAAAAOwLcpzra0xY8E5wV9n4bcJH2zqN";
    private static final String RECAPTCHA_VERIFY_URL = "https://www.google.com/recaptcha/api/siteverify";

    public static boolean verifyRecaptcha(String gRecaptchaResponse) {
        boolean check = false;
        try {

            if (gRecaptchaResponse == null || gRecaptchaResponse.isEmpty() || "".equals(gRecaptchaResponse)) {
                check = false;
            } else {
                String url = RECAPTCHA_VERIFY_URL + "?secret=" + SECRET_KEY + "&response=" + gRecaptchaResponse;

                HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();

                conn.setRequestMethod("GET");

                StringBuilder response;
                try (BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {
                    String inputLine;
                    response = new StringBuilder();
                    while ((inputLine = in.readLine()) != null) {
                        response.append(inputLine);
                    }
                }

                JsonObject jsonResponse = new Gson().fromJson(response.toString(), JsonObject.class);
                
                if (jsonResponse.get("success").getAsString().equals("true")) {
                    check = true;
                }
                
            }

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return check;
    }

}
