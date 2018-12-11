package pl.coderslab.services;

import java.util.List;

public interface PlanService<P> {
    void save(P p);
    void update(P p);
    void delete(P p);
    P findById(Long planId);
    long countByUser(Long userId);
    P findLatest();
    P findLatestByUser(Long userId);
    List<P> findAllByUser(Long userId);
}
