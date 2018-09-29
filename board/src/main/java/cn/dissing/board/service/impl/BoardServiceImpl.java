package cn.dissing.board.service.impl;

import cn.dissing.board.dao.BoardDao;
import cn.dissing.board.domain.PostInfo;
import cn.dissing.board.service.BoardService;
import com.alibaba.fastjson.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lilongyun on 2018/5/15.
 */
@Service
public class BoardServiceImpl implements BoardService {
    @Autowired
    private BoardDao boardDao;

    @Override
    public Map<String, Object> queryPosts(PostInfo postInfo) {
        Integer count = boardDao.queryPostsCount(postInfo);
        List<PostInfo> list =  boardDao.queryPosts(postInfo);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("totalPage", count%postInfo.getPageSize() != 0 ? count/postInfo.getPageSize()+1 : count/postInfo.getPageSize());
        map.put("list", list);
        return map;
    }

    @Override
    @Transactional
    public int savePost(PostInfo postInfo) {
        return boardDao.savePost(postInfo);
    }

    @Override
    @Transactional
    public int updatePost(PostInfo postInfo) {
        return boardDao.updatePost(postInfo);
    }
}
