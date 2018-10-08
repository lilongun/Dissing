package cn.dissing.board.dao;

import cn.dissing.board.domain.CategoryInfo;
import cn.dissing.board.domain.CommentInfo;
import cn.dissing.board.domain.PostInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * Created by lilongyun on 2018/5/15.
 */
@Mapper
public interface BoardDao {

    public List<PostInfo> queryPosts(PostInfo postInfo);

    public int savePost(PostInfo postInfo);

    public int updatePost(PostInfo postInfo);

    public Integer queryPostsCount(PostInfo postInfo);

    public List<CategoryInfo> queryCategorys();

    public PostInfo queryPostInfo(Integer id);

    public List<CommentInfo> queryComments(CommentInfo commentInfo);

    public Integer queryCommentsCount(CommentInfo commentInfo);
}
