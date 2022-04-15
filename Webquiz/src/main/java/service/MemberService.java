package service;

import model.Member;

import java.util.List;

public interface MemberService {
    public List<Member> getMemberList();
    public List<Member> getMaxPoint();
    public List<Member> getMemberNumber();
    public boolean deleteMember(Member member);
}
