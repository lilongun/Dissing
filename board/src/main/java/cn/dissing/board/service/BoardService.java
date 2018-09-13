package cn.dissing.board.service;

import cn.dissing.board.domain.PostInfo;

import java.util.List;
import java.util.Map;

/**
 * Created by lilongyun on 2018/5/15.
 */
public interface BoardService {
    public Map<String, Object> queryPosts(PostInfo postInfo);

    public int savePost(PostInfo postInfo);

    public int updatePost(PostInfo postInfo);
}
