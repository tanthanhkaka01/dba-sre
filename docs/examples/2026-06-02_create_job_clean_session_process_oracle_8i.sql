DECLARE
    v_jobno NUMBER;
BEGIN
    DBMS_JOB.SUBMIT
    (
        job => v_jobno,
        what => '
DECLARE
    vsql   VARCHAR2(4000) := '''';
    vcount NUMBER(5) := 0;
BEGIN
    vsql := ''BEGIN '';

    FOR vrecord IN (
        SELECT
            s.sid,
            s.serial#,
            s.username,
            s.status,
            s.machine,
            s.program,
            s.last_call_et / 60 AS idle_minutes,
            p.spid,
            ''EXECUTE IMMEDIATE ''''ALTER SYSTEM KILL SESSION '''''''''' ||
            s.sid || '','' || s.serial# || '''''''''' IMMEDIATE'''';'' AS sql_kill
        FROM v$session s,
             v$process p
        WHERE s.paddr = p.addr
          AND s.status = ''INACTIVE''
          AND s.last_call_et / 60 >= 60 * 4
          AND s.username = ''APPUSER''
          AND UPPER(s.program) LIKE ''%LEGACY_BATCH_JOB%''
        ORDER BY s.last_call_et DESC
    )
    LOOP
        vsql := vsql || vrecord.sql_kill || '' '';
        vcount := vcount + 1;
    END LOOP;

    vsql := vsql || ''END;'';

    IF vcount > 0 THEN
        EXECUTE IMMEDIATE vsql;
    END IF;
END;
',
        next_date => SYSDATE,
        interval  => 'SYSDATE + 5/(24*60)'
    );

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('JOB CREATED: ' || v_jobno);
END;
/