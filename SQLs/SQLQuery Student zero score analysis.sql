use [StudentProductivity DB]

SELECT COUNT(*) AS TotalRows 
FROM [dbo].[Student Performance LAST Version]


--================================================================================
-- Case Study: The Zero Productivity Extreme:
-- Note: Only 1 student in the dataset has productivity_score = 0 (Student 10598)
--================================================================================

SELECT * 
FROM [dbo].[Student Performance LAST Version]
WHERE productivity_score = 0;

--======================
--1_Distraction metrics:
--======================

SELECT 
    student_id,
    CAST(phone_usage_hours AS DECIMAL(10,2)) AS Phone_Hrs,
    Phone_usage_Level,
    CAST(social_media_hours AS DECIMAL(10,2)) AS Social_Hrs,
    CAST(youtube_hours AS DECIMAL(10,2)) AS YouTube_Hrs,
    CAST(gaming_hours AS DECIMAL(10,2)) AS Gaming_Hrs,
    CAST(Distraction_time AS DECIMAL(10,2)) AS Total_Dist_Time,
    Distraction_ratio_level AS Dist_Risk,
    CAST(Distraction_ratio_to_study_hours AS DECIMAL(10,2)) AS Dist_Ratio,
    Primary_distraction_source AS Main_Distractor
FROM [dbo].[Student Performance LAST Version]
WHERE productivity_score = 0;

--======================
--2_Performance drivers:
--======================

SELECT 
    student_id,
    age, gender,
    CAST(study_hours_per_day AS DECIMAL(10,2)) AS Study_Hrs,
    Study_Level,
    CAST(sleep_hours AS DECIMAL(10,2)) AS Sleep_Hrs,
    Sleep_Level,
    CAST(coffee_intake_mg AS DECIMAL(10,2)) AS Caffeine_MG,
    Caffiene_Category,
    CAST(exercise_minutes AS DECIMAL(10,2)) AS Exercise_Mins,
    Activity_level,
    stress_level,
    Stress_category, 
    breaks_per_day AS Breaks
FROM [dbo].[Student Performance LAST Version]
WHERE productivity_score = 0;



--====================
--3_Academic outcomes:
--====================

SELECT 
    student_id,
    CAST(attendance_percentage AS DECIMAL(10,2)) AS Attend_Pct,
    Attendancee_level,
    assignments_completed AS Tasks_Done,
    Assignment_completed_level AS Task_Level,
    focus_score, 
    Focus_level,
    CAST(final_grade AS DECIMAL(10,2)) AS Grade,
    Performance_tier,
    productivity_score,
    Productivity_Level,
    CAST(Productivity_gap AS DECIMAL(10,2)) AS Prod_Gap
FROM [dbo].[Student Performance LAST Version]
WHERE productivity_score = 0;


/* =================
CASE STUDY ANALYSIS:
====================

- OBSERVED PHENOMENON: Complete academic productivity collapse (Score: 0).

- POTENTIAL ROOT CAUSE: Excessive digital consumption (11.22 phone hours/day),
  primarily driven by social media distractions, leading to reduced focus
  and continuous cognitive overload.

- PERFORMANCE IMPACT: Despite high physical activity levels, the student shows
  severe mental burnout (Stress Level: 10/10), extreme sleep deprivation
  (3.34 hrs/day), and low focus levels (40/100).

- PHYSIOLOGICAL INSIGHT: The findings indicate that prolonged intense exercise
  under severe stress and sleep deprivation conditions may contribute to
  burnout escalation rather than cognitive recovery.

- ACADEMIC OUTCOME: Failed grade (F) with critical attendance status (At Risk),
  indicating a complete academic shutdown pattern.

=============================================================================== */


--======================================================================
-- COMPARATIVE BENCHMARK ANALYSIS:
-- (Comparing the zero-productivity student against the campus baseline)
--======================================================================

SELECT 
    'Average Student' AS Student_Type,
    CAST(AVG(phone_usage_hours) AS DECIMAL(10,2)) AS Avg_Phone_Hrs,
    CAST(AVG(study_hours_per_day) AS DECIMAL(10,2)) AS Avg_Study_Hrs,
    CAST(AVG(focus_score) AS DECIMAL(10,2)) AS Avg_Focus_Score,
    CAST(AVG(final_grade) AS DECIMAL(10,2)) AS Avg_Grade
FROM [dbo].[Student Performance LAST Version]
WHERE productivity_score > 0

UNION ALL

SELECT 
    'Zero Productivity Student' AS Student_Type,
    CAST(phone_usage_hours AS DECIMAL(10,2)) AS Phone_Hrs,
    CAST(study_hours_per_day AS DECIMAL(10,2)) AS Study_Hrs,
    focus_score,
    CAST(final_grade AS DECIMAL(10,2)) AS Grade
FROM [dbo].[Student Performance LAST Version]
WHERE productivity_score = 0;


/* ========================================
CASE STUDY COMPARATIVE ANALYSIS CONCLUSION: 
===========================================
- DATA EVIDENCE:
  * Phone Usage: Zero-Prod Student (11.22 hrs) vs. Campus Average (6.25 hrs). [~80% Increase]
  * Study Hours: Zero-Prod Student (1.16 hrs) vs. Campus Average (5.25 hrs).  [~78% Drop]
  * Focus Score: Zero-Prod Student (40) vs. Campus Average (64).
  * Final Grade: Zero-Prod Student (62.67) vs. Campus Average (70.27).

- COMPARATIVE CONCLUSION:
  The data proves that this student is not just "slightly distracted"—their digital 
  consumption is double the campus average, which directly starved their study 
  time from 5+ hours down to just 1 hour. This comparison confirms that excessive 
  phone usage acts as a "Time and Focus Hijacker," driving a 24-point drop in 
  focus and pulling the student below the baseline academic performance of their peers.
=======================================================================================
*/


/* ================================================
ACTIONABLE RECOMMENDATIONS & BURNOUT RECOVERY PLAN:
===================================================
1. DIGITAL DETOX & DISTRACTION CONTROL:
   - Enforce strict app limits (e.g., StayFree/Freedom) to restrict Social Media.
   - Target: Reduce total distraction time from 10+ hours to a max of 2 hours/day.

2. SLEEP HYGIENE CLINIC:
   - Implement a "No-Screen" rule 60 minutes before bedtime to block blue light.
   - Target: Gradually scale up sleep hours from 3.34 hours to a healthy 7 hours 
     to lower Cortisol (stress hormone) levels.

3. COGNITIVE RECOVERY & STRESS MANAGEMENT:
   - Modify Exercise: Reduce intense workouts from 84 mins to 30-45 mins, replacing 
     the rest with mindful walking to alleviate severe mental burnout (10/10 Stress).
   - Morning Routine: Practice a "Zero-Phone Morning" for the first 30 minutes 
     after waking up to prevent early-day anxiety and dopamine spikes.
   - Quick Relief: Utilize the Box Breathing technique (4-4-4-4 seconds) and 
     "Brain Dumping" on paper to clear mental clutter before studying.

4. GRADUAL ACADEMIC RE-INTEGRATION:
   - Adopt the Pomodoro Technique (25 mins study, 5 mins break) with the phone 
     in another room to accommodate the current low focus score (40/100).
   - Tie assignments completion to micro-rewards to rebuild positive academic habits.

CONCLUSION: Academic recovery cannot happen without psychological baseline restoration. 
We must fix the sleep and digital hijacking before expecting optimal performance.
====================================================================================
*/