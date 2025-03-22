/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import model.GoogleAccount;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;


/**
 *
 * @author ACER
 */
public class GoogleLoginUtils {
    
    private static final String GOOGLE_LINK_GET_TOKEN = "https://oauth2.googleapis.com/token";
    private static final String CLIENT_ID = "219231988364-35fqg91uck8vqcdfm6jd01cf3jk4s245.apps.googleusercontent.com";
    private static final String CLIENT_SECRET = "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";
    private static final String GRANT_TYPE = "authorization_code";
    private static final String GET_INFO_USER = "https://www.googleapis.com/oauth2/v2/userinfo?access_Token=";
    private static final String REDIRECT_URI = "http://localhost:8080/UserManagementT4S4_JSP_EL_JSTL/MainController?action=LoginWithGoogle";
    
    
    public static String getToken(String code) throws IOException {
        String response = Request.Post(GOOGLE_LINK_GET_TOKEN).bodyForm(Form.form()
                .add("client_id", CLIENT_ID)
                .add("client_secret", CLIENT_SECRET)
                .add("redirect_uri", REDIRECT_URI)
                .add("code", code)
                .add("grant_type", GRANT_TYPE).build())
                .execute().returnContent().asString();
        

        JsonObject json = new Gson().fromJson(response, JsonObject.class);
        String accessToken = json.get("access_token").toString().replaceAll("\"", "");

        return accessToken;
    }
    
    public static GoogleAccount getUserInfor(String accessToken) throws IOException {
        String linkGetInfor = GET_INFO_USER + accessToken;
        String response = Request.Get(linkGetInfor).addHeader("Authorization", "Bearer" + accessToken)
                .execute()
                .returnContent()
                .asString();
        GoogleAccount googleAccount = new Gson().fromJson(response, GoogleAccount.class);
        return googleAccount;
    }
    
    
}
