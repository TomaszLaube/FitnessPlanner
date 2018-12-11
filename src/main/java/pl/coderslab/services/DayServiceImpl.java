package pl.coderslab.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.models.Day;
import pl.coderslab.repositories.DayRepository;

import javax.transaction.Transactional;
import java.util.List;
@Service
@Transactional
public class DayServiceImpl implements DayService<Day> {

    @Autowired
    DayRepository dayRepository;

    @Override
    public List<Day> findAllDays() {
        return dayRepository.findAllByOrderById();
    }
}
