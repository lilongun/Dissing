package cn.dissing.authserver.controller;

import cn.dissing.authserver.domain.SysUser;
import cn.dissing.authserver.service.UserService;
import cn.dissing.board.domain.CommentInfo;
import cn.dissing.board.domain.PostInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

/**
 * Created by lilongyun on 2018/5/10.
 */
@RestController
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("/user")
    public Principal user(Principal user){
        return user;
    }

    @GetMapping("/currentUser")
    public SysUser currentUser(Principal user){
        SysUser sysUser = userService.findOneWithRolesByUsername(user.getName());
        return sysUser;
    }

    @GetMapping("/getUserInfoById/{id}")
    public SysUser getUserInfoById(@PathVariable("id") Integer id){
        SysUser sysUser = userService.getUserInfoById(id);
        return sysUser;
    }

    @PostMapping("/getPostUserName")
    public List<PostInfo> getPostUserName(@RequestBody List<PostInfo> postInfoList){
        for( PostInfo postInfo : postInfoList ) {
            postInfo.setUsername(userService.findUserNameById(postInfo.getOwnerId()));
        }
        return postInfoList;
    }

    @PostMapping("/getCommentUserName")
    public List<CommentInfo> getCommentUserName(@RequestBody List<CommentInfo> commentInfoList){
        for( CommentInfo commentInfo : commentInfoList ) {
            commentInfo.setUsername(userService.findUserNameById(commentInfo.getOwnerId()));
        }
        return commentInfoList;
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
        SysUser user = userService.findOneWithRolesByUsername(sysUser.getUsername());
        if( user != null){
            return "repeated";
        }
        String hashed = BCrypt.hashpw(sysUser.getPassword(), BCrypt.gensalt());
        System.out.println(hashed);
        sysUser.setPassword(hashed);
        int result = userService.saveUser(sysUser);
        if(result > 0){
            System.out.println("save successed");
            return "success";
        }
        return "fail";
    }

    @RequestMapping(value="/updateUser", method = RequestMethod.POST)
    public String updateUser(@RequestBody SysUser sysUser, Principal user) {
        if( !user.getName().equals(sysUser.getUsername()) ){
            return "fail";
        }
        if( sysUser.getPassword() != null ) {
            String hashed = BCrypt.hashpw(sysUser.getPassword(), BCrypt.gensalt());
            System.out.println(hashed);
            sysUser.setPassword(hashed);
        }
        int result = userService.updateUser(sysUser);
        if(result > 0){
            System.out.println("save successed");
            return "success";
        }
        return "fail";
    }
}
