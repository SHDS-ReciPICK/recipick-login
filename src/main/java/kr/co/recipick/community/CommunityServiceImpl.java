package kr.co.recipick.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.recipick.member.MemberVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	private CommunityMapper mapper;

	@Override
	public List<CommunityVO> communityList(int startIndex, int pageSize, String sort) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("startIndex", startIndex);
	    params.put("pageSize", pageSize);
	    params.put("sort", sort);

	    return mapper.communityList(params);
	}
	
	@Override
	public CommunityVO postDetail(int post_id) {
		return mapper.postDetail(post_id);
	}

	@Override
	public List<CommunityVO> postImageList(int post_id) {
		return mapper.postImageList(post_id);
	}

	@Override
	public boolean writePost(CommunityVO vo) {
		return mapper.writePost(vo) > 0;
	}

	@Override
	public boolean attachImage(CommunityVO vo) {
		return mapper.attachImage(vo) > 0;
	}

	@Override
	public boolean increaseView(int post_id) {
		return mapper.increaseView(post_id) > 0;
	}

	@Override
	public int countPost() {
		return mapper.countPost();
	}

    @Override
    @Transactional
    public boolean updatePost(CommunityVO vo) {
        return mapper.updatePost(vo) > 0;
    }
    
    @Override
    @Transactional
    public boolean deletePost(int post_id) {
        // 1. 게시글에 달린 댓글 삭제
        mapper.deletePostReply(post_id);
        
        // 2. 게시글에 첨부된 사진 삭제
        mapper.deletePostImage(post_id);
        
        // 3. 게시글 삭제
        return mapper.deletePost(post_id) > 0;
    }
    
    @Override
    public boolean deletePostImage(int post_id) {
        return mapper.deletePostImage(post_id) > 0;
    }
    
	@Override
	public boolean deletePostReply(int post_id) {
		return mapper.deletePostReply(post_id) > 0;
	}
    
	@Override
	public List<CommunityVO> replyList(int post_id) {
		return mapper.replyList(post_id);
	}
	
	@Override
	public CommunityVO replyDetail(int reply_id) {
		return mapper.replyDetail(reply_id);
	}

	@Override
	public boolean writeReply(CommunityVO vo) {
		return mapper.writeReply(vo) > 0;
	}
	
    @Override
    @Transactional
    public boolean updateReply(CommunityVO vo) {
        return mapper.updateReply(vo) > 0;
    }
    
    @Override
    @Transactional
    public boolean deleteReply(int reply_id) {
        return mapper.deleteReply(reply_id) > 0;
    }

	@Override
	@Transactional
	public boolean deleteSingleImage(int post_image_id) {
		return mapper.deleteSingleImage(post_image_id) > 0;
	}

	@Override
	public CommunityVO singleImageDetail(int post_image_id) {
		return mapper.singleImageDetail(post_image_id);
	}

	@Override
	public boolean updateImageNo(CommunityVO vo) {
		return mapper.updateImageNo(vo) > 0;
	}

	@Override
	public List<CommunityVO> myrecipeList(int startIndex, int pageSize, String sort, int memberId) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("startIndex", startIndex);
	    params.put("pageSize", pageSize);
	    params.put("sort", sort);
	    params.put("member_id", memberId); // 추가
	    return mapper.myrecipeList(params);
	}
    @Override
    public int countPostMyrecipe(int memberId) {
    	return mapper.countPostMyrecipe(memberId);
    }
	@Override
	public  CommunityVO detail(MemberVO vo) {
		return mapper.detail(vo);
	}

}