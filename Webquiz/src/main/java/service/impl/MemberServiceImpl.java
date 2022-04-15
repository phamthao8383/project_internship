package service.impl;

import model.Member;
import repository.MemberRepository;
import service.MemberService;

import java.util.List;

public class MemberServiceImpl implements MemberService {
    MemberRepository memberRepository = new MemberRepository();

    @Override
    public List<Member> getMemberList() {
        return memberRepository.getMemberList();
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

}
