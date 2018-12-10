package pl.coderslab.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.models.Plan;
import pl.coderslab.repositories.PlanRepository;

import javax.transaction.Transactional;
import java.sql.Timestamp;
import java.util.Date;
@Service
@Transactional
public class PlanServiceImpl implements PlanService<Plan> {

    @Autowired
    PlanRepository planRepository;

    @Override
    public void save(Plan plan) {
        plan.setCreated(new Timestamp(new Date().getTime()));
        planRepository.save(plan);
    }

    @Override
    public void update(Plan plan) {
        plan.setUpdated(new Timestamp(new Date().getTime()));
        planRepository.save(plan);
    }

    @Override
    public void delete(Plan plan) {
        planRepository.delete(plan);
    }

    @Override
    public Plan findById(Long planId) {
        return planRepository.findPlanById(planId);
    }

    @Override
    public long countByUser(Long userId) {
        return planRepository.countPlansByUserId(userId);
    }

    @Override
    public Plan findLatest() {
        return planRepository.findFirstByOrderByCreatedDesc();
    }

    @Override
    public Plan findLatestByUser(Long userId) {
        return planRepository.findFirstByUserIdOrderByCreatedDesc(userId);
    }
}
