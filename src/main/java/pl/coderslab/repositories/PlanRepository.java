package pl.coderslab.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.models.Plan;

import java.util.List;

public interface PlanRepository extends JpaRepository<Plan,Long> {
    long countPlansByUserId(Long userId);
    Plan findPlanById(Long planId);
    Plan findFirstByOrderByCreatedDesc();
    Plan findFirstByUserIdOrderByCreatedDesc(Long userId);
    List<Plan> findPlansByUserIdOrderByCreatedDesc(Long userId);
}
