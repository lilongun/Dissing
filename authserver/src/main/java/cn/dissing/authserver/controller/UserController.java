package cn.dissing.authserver.controller;

import cn.dissing.authserver.domain.SysUser;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

/**
 * Created by lilongyun on 2018/5/10.
 */
@RestController
public class UserController {
    @GetMapping("/user")
    public Principal user(Principal user){
        return user;
    }

    @GetMapping("/getBCryptPassword")
    public String getBCryptPassword(@RequestParam String password) {
        String hashed = BCrypt.hashpw(password, BCrypt.gensalt());
        System.out.println(hashed);
        String hashed2 = BCrypt.hashpw(password, BCrypt.gensalt(12));
        String candidate = password;
        if (BCrypt.checkpw(candidate, hashed)) {
            System.out.println("It matches");
            return hashed;
        }else {
            System.out.println("It does not match");
        }
        return "";
    }

    @RequestMapping(value="/registerUser", method = RequestMethod.PUT)
    public String registerUser(@RequestBody SysUser sysUser) {
        String hashed = BCrypt.hashpw(sysUser.getPassword(), BCrypt.gensalt());
        System.out.println(hashed);

        return "";
    }
}
