package data.dao.participant;

import data.hibernate.entity.Participant;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class ParticipantDAO implements IParticipantDAO {
    SessionFactory sessionFactory;

    @Autowired
    public ParticipantDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @Transactional
    public List<Participant> getParticipants() {
        Session session = sessionFactory.getCurrentSession();

        return session.createQuery("From Participant").list();
    }

    @Override
    @Transactional
    public void createParticipant(Participant participant) {
        Session session = sessionFactory.getCurrentSession();

        session.save(participant);
    }

    @Override
    @Transactional
    public void removeParticipant(Participant participant) {
        Session session = sessionFactory.getCurrentSession();

        session.remove(participant);
    }
}
