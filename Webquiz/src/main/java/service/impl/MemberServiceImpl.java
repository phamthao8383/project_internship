package service.impl;

import model.Member;
import repository.MemberRepository;
import service.MemberService;

import java.util.List;

public class MemberServiceImpl implements MemberService {
    MemberRepository memberRepository = new MemberRepository();

    @Override
    public List<Member> getMemberList(int indexPage) {
        return memberRepository.getMemberList(indexPage);
    }

    @Override
    public List<Member> searchMemberList(int indexPage, String nameSearch) {
        return memberRepository.searchMemberList(indexPage, nameSearch);
    }

    @Override
    public int getTotalMember() {
        return memberRepository.getTotalMember();
    }

    @Override
    public List<Member> getMaxPoint() {
        return memberRepository.getMaxPoint();
    }

    @Override
    public List<Member> getMemberNumber() {
        return memberRepository.getMemberNumber();
    }

    @Override
    public boolean deleteMember(Member member) {
        return memberRepository.deleteMember(member);
    }

    @Override
    public void updateMember(Member memberSearch, Member memberUpdate) {
        memberRepository.updateMember(memberSearch, memberUpdate);
    }

}
