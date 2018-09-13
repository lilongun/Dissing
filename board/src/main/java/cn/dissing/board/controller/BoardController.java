package cn.dissing.board.controller;

import cn.dissing.board.domain.PostInfo;
import cn.dissing.board.service.BoardService;
import com.alibaba.fastjson.JSONArray;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * Created by lilongyun on 2018/5/10.
 */
@RestController
@Api
public class BoardController {
    @Autowired
    private BoardService boardService;

    @RequestMapping(value="/hello", method= RequestMethod.GET)
    @PreAuthorize("hasAuthority('query-order')")
    public String hello(){
        return "hello!";
    }

    @RequestMapping(value="/queryList", method=RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> queryList(@RequestParam(required = false) String orderNumber,
                                         @RequestParam(required = false) Integer id,
                                         @RequestParam(required = false) Integer pageNum){
        PostInfo postInfo = new PostInfo();
        postInfo.setOrderNumber(orderNumber);
        postInfo.setId(id);
        int pageSize = 10;
        if(pageNum == null){
            pageNum = 1;
        }
        postInfo.setBeginPos((pageNum - 1) * pageSize);
        postInfo.setPageSize(pageSize);
        return boardService.queryPosts(postInfo);
    }

    @RequestMapping(value="/savePost", method=RequestMethod.PUT)
    @ResponseBody
    @PreAuthorize("hasAuthority('admin')")
    public String savePost(@RequestBody PostInfo postInfo){
        JSONArray array = JSONArray.parseArray(postInfo.getProduct());
        int result = boardService.savePost(postInfo);
        if(result == 1) {
            return "success";
        }
        return "fail";
    }

    @RequestMapping(value="/updatePost", method=RequestMethod.POST)
    @ResponseBody
    @PreAuthorize("hasAuthority('admin')")
    public String updatePost(@RequestBody PostInfo postInfo){
        JSONArray array = JSONArray.parseArray(postInfo.getProduct());
        int result = boardService.updatePost(postInfo);
        if(result == 1) {
            return "success";
        }
        return "fail";
    }

    @RequestMapping(value="/deletePost/{id}", method=RequestMethod.DELETE)
    @ResponseBody
    @PreAuthorize("hasAuthority('admin')")
    public String deletePost(@PathVariable("id") Integer id){
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
