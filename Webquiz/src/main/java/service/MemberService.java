package service;

import model.Member;

import java.util.List;

public interface MemberService {
    List<Member> getMemberList(int indexPage);
    int getTotalMember();
    List<Member> getMaxPoint();
    List<Member> getMemberNumber();
    boolean deleteMember(Member member);
    void updateMember(Member memberSearch, Member memberUpdate);
}
