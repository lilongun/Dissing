package cn.dissing.board.service.impl;

import cn.dissing.board.dao.BoardDao;
import cn.dissing.board.domain.CategoryInfo;
import cn.dissing.board.domain.CommentInfo;
import cn.dissing.board.domain.PostInfo;
import cn.dissing.board.service.BoardService;
import cn.dissing.board.service.UserService;
import com.alibaba.fastjson.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
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

    @Autowired
    private UserService userService;

    @Override
    public Map<String, Object> queryPosts(PostInfo postInfo, boolean isShowUserName) {
        Integer count = boardDao.queryPostsCount(postInfo);
        List<PostInfo> list =  boardDao.queryPosts(postInfo);

        if(isShowUserName){
            list = userService.getPostUserName(list);
        }

        List<CategoryInfo> categoryInfos = boardDao.queryCategorys();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("totalPage", count%postInfo.getPageSize()>0 ? count/postInfo.getPageSize()+1 : count/postInfo.getPageSize());
        map.put("list", list);
        map.put("categoryInfos", categoryInfos);
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

    @Override
    public List<CategoryInfo> queryCategoryList() {
        return boardDao.queryCategorys();
    }

    @Override
    public Map<String, Object> queryPostInfo(Integer id) {
        PostInfo postInfo = boardDao.queryPostInfo(id);
        CommentInfo commentInfo = new CommentInfo();
        commentInfo.setPostId(id);
        List<CommentInfo> commentInfolist =  boardDao.queryComments(commentInfo);
        Integer count = boardDao.queryCommentsCount(commentInfo);

        for( CommentInfo comment : commentInfolist ){
            comment.setChildren(getChildrenCommentInfos(comment.getId()));
        }

        List<PostInfo> list = new ArrayList<PostInfo>();
        list.add(postInfo);
        list = userService.getPostUserName(list);

        commentInfolist = userService.getCommentUserName(commentInfolist);

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("totalPage", count%commentInfo.getPageSize()>0 ? count/commentInfo.getPageSize()+1 : count/commentInfo.getPageSize());
        map.put("commentInfolist", commentInfolist);
        map.put("postInfo", list.get(0));
        return map;
    }

    private List<CommentInfo> getChildrenCommentInfos(Integer parentId){
        CommentInfo commentInfo = new CommentInfo();
        commentInfo.setParentId(parentId);
        Integer count = boardDao.queryCommentsCount(commentInfo);
        if( count > 0 ){
            List<CommentInfo> children = boardDao.queryComments(commentInfo);
            for( CommentInfo comment : children ){
                comment.setChildren(getChildrenCommentInfos(comment.getId()));
            }
            return children;
        }
        return null;
    }
}
