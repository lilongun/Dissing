package cn.dissing.board.service;

import cn.dissing.board.domain.CommentInfo;
import cn.dissing.board.domain.PostInfo;
import cn.dissing.board.domain.SysUser;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.List;

/**
 * Created by lilongyun on 2018/9/21.
 */
@FeignClient(value="authserver")
public interface UserService {
    @GetMapping("/currentUser")
    public SysUser currentUser(@RequestParam("access_token") String accessToken);

    @PostMapping("/getPostUserName")
    public List<PostInfo> getPostUserName(@RequestBody List<PostInfo> postInfoList);

    @PostMapping("/getCommentUserName")
    public List<CommentInfo> getCommentUserName(@RequestBody List<CommentInfo> commentInfoList);

    @GetMapping("/getUserInfoById")
    public SysUser getUserInfoById(@RequestParam("id") Integer id);
}
