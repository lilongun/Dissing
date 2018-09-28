package cn.dissing.board.controller;

import cn.dissing.board.domain.PostInfo;
import cn.dissing.board.domain.SysUser;
import cn.dissing.board.service.BoardService;
import cn.dissing.board.service.UserService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.Map;

/**
 * Created by lilongyun on 2018/5/10.
 */
@RestController
@Api
public class BoardController {
    @Autowired
    private BoardService boardService;

    @Autowired
    private UserService userService;

    @RequestMapping(value="/hello", method= RequestMethod.GET)
    @PreAuthorize("hasAuthority('query-order')")
    public String hello(){
        return "hello!";
    }

    @RequestMapping(value="/queryPostList", method=RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> queryPostList(@RequestParam(required = false) Integer typeId,
                                             @RequestParam(required = false) String subject,
                                         @RequestParam(required = false) Integer pageNum){
        PostInfo postInfo = new PostInfo();
        postInfo.setTypeId(typeId);
        postInfo.setSubject(subject);
        int pageSize = 20;
        if(pageNum == null){
            pageNum = 1;
        }
        postInfo.setBeginPos((pageNum - 1) * pageSize);
        postInfo.setPageSize(pageSize);
        return boardService.queryPosts(postInfo);
    }

    @RequestMapping(value="/queryMyPostList", method=RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> queryMyPostList(@RequestParam(required = false) Integer typeId,
                                               @RequestParam(required = false) String subject,
                                             @RequestParam(required = false) Integer pageNum,
                                             @RequestParam("access_token") String accessToken){
        SysUser sysUser = userService.currentUser(accessToken);
        PostInfo postInfo = new PostInfo();
        postInfo.setSubject(subject);
        postInfo.setTypeId(typeId);
        int pageSize = 10;
        if(pageNum == null){
            pageNum = 1;
        }
        postInfo.setOwnerId(sysUser.getId());
        postInfo.setBeginPos((pageNum - 1) * pageSize);
        postInfo.setPageSize(pageSize);
        return boardService.queryPosts(postInfo);
    }

    @RequestMapping(value="/savePost", method=RequestMethod.PUT)
    @ResponseBody
    @PreAuthorize("hasAuthority('query-board')")
    public String savePost(@RequestBody PostInfo postInfo, Principal user, @RequestParam("access_token") String accessToken){
        SysUser sysUser = userService.currentUser(accessToken);
        postInfo.setOwnerId(sysUser.getId());
        int result = boardService.savePost(postInfo);
        if(result == 1) {
            return "success";
        }
        return "fail";
    }

    @RequestMapping(value="/updatePost", method=RequestMethod.POST)
    @ResponseBody
    @PreAuthorize("hasAuthority('query-board')")
    public String updatePost(@RequestBody PostInfo postInfo, Principal user, @RequestParam("access_token") String accessToken){
        SysUser sysUser = userService.currentUser(accessToken);
        postInfo.setOwnerId(sysUser.getId());
        int result = boardService.updatePost(postInfo);
        if(result == 1) {
            return "success";
        }
        return "fail";
    }

    @RequestMapping(value="/deletePost/{id}", method=RequestMethod.DELETE)
    @ResponseBody
    @PreAuthorize("hasAuthority('query-board')")
    public String deletePost(@PathVariable("id") Integer id, Principal user, @RequestParam("access_token") String accessToken){
        SysUser sysUser = userService.currentUser(accessToken);
        PostInfo postInfo = new PostInfo();
        postInfo.setId(id);
        postInfo.setIsDeleted(true);
        int result = boardService.updatePost(postInfo);
        if(result == 1) {
            return "success";
        }
        return "fail";
    }

}
