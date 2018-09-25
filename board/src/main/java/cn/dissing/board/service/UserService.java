package cn.dissing.board.service;

import cn.dissing.board.domain.SysUser;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

/**
 * Created by lilongyun on 2018/9/21.
 */
@FeignClient(value="authserver")
public interface UserService {
    @GetMapping("/currentUser")
    public SysUser currentUser(@RequestParam("access_token") String accessToken);
}