package pl.coderslab.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.models.Day;

import java.util.List;

public interface DayRepository extends JpaRepository<Day,Long> {
    List<Day> findAllByOrderById();
}
