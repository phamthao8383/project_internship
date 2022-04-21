package service;

import model.Member;

import java.util.List;

public interface MemberService {
    public List<Member> getMemberList(int indexPage);
    public int getTotalMember();
    public List<Member> getMaxPoint();
    public List<Member> getMemberNumber();
    public boolean deleteMember(Member member);
    public void updateMember(Member memberSearch, Member memberUpdate);
}
