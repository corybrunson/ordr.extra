#' Healthcare worker burnout data
#'
#' Data from a 2022 longitudinal study by Guatello et al. on professional
#' burnout and fulfillment in healthcare workers (HCW) during the Covid-19 
#' pandemic.
#' 
#' @format ## `hcw`
#' A data frame with 467 rows and 49 columns:
#' \describe{
#'   \item{record_id}{Subject identifier}
#'   \item{hc_prov}{Subject is a healthcare provider: 1 = TRUE, 0 = FALSE}
#'   \item{occ}{Occupation: 1 = physician, 2 = medical student, 3 = advanced
#'   practice worker (CRNA, NP, PA), 4 = nurse (LPN, RN, and trainees), 15 = 
#'   dentist, 5 = physical therapist, 6 = occupational therapist, 7 = 
#'   respiratory therapist, 11 = respiratory technician, 12 = radiology 
#'   technician, 8 = psychologist, 9 = nursing assistant, 13 = sitter, 14 = 
#'   transport, 10 = other occupation}
#'   \item{pfi_01a}{During the past two weeks, how true do you feel the 
#'   following statement is about you at work: I feel happy at work (0 = not at 
#'   all, 4 = extremely)}
#'   \item{pfi_01b}{During the past two weeks, how true do you feel the 
#'   following statement is about you at work: I feel worthwhile at work (0 = 
#'   not at all, 4 = extremely)}
#'   \item{pfi_01c}{During the past two weeks, how true do you feel the 
#'   following statement is about you at work: My work is satisfying to me (0 = 
#'   not at all, 4 = extremely)}
#'   \item{pfi_01d}{During the past two weeks, how true do you feel the 
#'   following statement is about you at work: I feel in control when dealing 
#'   with difficult problems at work (0 = not at all, 4 = extremely)}
#'   \item{pfi_01e}{During the past two weeks, how true do you feel the 
#'   following statement is about you at work: My work is meaningful to me (0 = 
#'   not at all, 4 = extremely)}
#'   \item{pfi_01f}{During the past two weeks, how true do you feel the 
#'   following statement is about you at work: I'm contributing professionally 
#'   (e.g. patient care, teaching, research, and leadership) in the ways I value 
#'   most (0 = not at all, 4 = extremely)}
#'   \item{pfi_02a}{To what degree have you experienced the following: a sense 
#'   of dread when I think about work I have to do (0 = not at all, 4 = 
#'   extremely)}
#'   \item{pfi_02b}{To what degree have you experienced the following: 
#'   physically exhausted at work (0 = not at all, 4 = extremely)}
#'   \item{pfi_02c}{To what degree have you experienced the following: lacking 
#'   in enthusiasm at work (0 = not at all, 4 = extremely)}
#'   \item{pfi_02d}{To what degree have you experienced the following:
#'   emotionally exhausted at work (0 = not at all, 4 = extremely)}
#'   \item{pfi_03a}{During the past two weeks, my job has contributed to me 
#'   feeling: less empathetic with my patients (0 = not at all, 4 = extremely)}
#'   \item{pfi_03b}{During the past two weeks, my job has contributed to me 
#'   feeling: less empathetic with my colleagues (0 = not at all, 4 = 
#'   extremely)}
#'   \item{pfi_03c}{During the past two weeks, my job has contributed to me 
#'   feeling: less sensitive to others' feelings/emotions (0 = not at all, 4 = 
#'   extremely)}
#'   \item{pfi_03d}{During the past two weeks, my job has contributed to me 
#'   feeling: less interested in talking with my patients (0 = not at all, 4 = 
#'   extremely)}
#'   \item{pfi_03e}{During the past two weeks, my job has contributed to me 
#'   feeling: less connected with my patients (0 = not at all, 4 = extremely)}
#'   \item{pfi_03f}{During the past two weeks, my job has contributed to me 
#'   feeling: less connected with my colleagues (0 = not at all, 4 = extremely)}
#'   \item{phq9_01}{Over the last two weeks, how often have you been bothered by 
#'   the following problem: little interest or pleasure in doing things (0 = not 
#'   at all, 3 = nearly every day)}
#'   \item{phq9_02}{Over the last two weeks, how often have you been bothered by 
#'   the following problem: feeling down, depressed, or hopeless (0 = not at 
#'   all, 3 = nearly every day)}
#'   \item{phq9_03}{Over the last two weeks, how often have you been bothered by 
#'   the following problem: trouble falling or staying asleep or sleeping too 
#'   much (0 = not at all, 3 = nearly every day)}
#'   \item{phq9_04}{Over the last two weeks, how often have you been bothered by 
#'   the following problem: feeling tired or having little energy(0 = not at 
#'   all, 3 = nearly every day)}
#'   \item{phq9_05}{Over the last two weeks, how often have you been bothered by 
#'   the following problem: poor appetite or overeating (0 = not at all, 3 = 
#'   nearly every day)}
#'   \item{phq9_06}{Over the last two weeks, how often have you been bothered by 
#'   the following problem: feeling bad about yourself - or that you are a 
#'   failure or have let yourself or your family down (0 = not at all, 3 = 
#'   nearly every day)}
#'   \item{phq9_07}{Over the last two weeks, how often have you been bothered by 
#'   the following problem: trouble concentrating on things, such as reading the 
#'   newspaper or watching television (0 = not at all, 3 = nearly every day)}
#'   \item{phq9_08}{Over the last two weeks, how often have you been bothered by 
#'   the following problem: moving or speaking so slowly that other people could 
#'   have noticed? Or the opposite - being so fidgety or restless that you have 
#'   been moving around a lot more than usual (0 = not at all, 3 = nearly every 
#'   day)}
#'   \item{gad7_01}{Over the last 2 weeks, how often have you been bothered by 
#'   the following problems: feeling nervous, anxious, or on edge (0 = not at 
#'   all, 3 = nearly every day)}
#'   \item{gad7_02}{Over the last 2 weeks, how often have you been bothered by 
#'   the following problems: not being able to stop or control worrying (0 = not 
#'   at all, 3 = nearly every day)}
#'   \item{gad7_03}{Over the last 2 weeks, how often have you been bothered by 
#'   the following problems: worrying too much about different things (0 = not 
#'   at all, 3 = nearly every day)}
#'   \item{gad7_04}{Over the last 2 weeks, how often have you been bothered by 
#'   the following problems: having trouble relaxing (0 = not at all, 3 = nearly 
#'   every day)}
#'   \item{gad7_05}{Over the last 2 weeks, how often have you been bothered by 
#'   the following problems: being so restless that it's hard to sit still (0 = 
#'   not at all, 3 = nearly every day)}
#'   \item{gad7_06}{Over the last 2 weeks, how often have you been bothered by 
#'   the following problems: becoming easily annoyed or irritable (0 = not at 
#'   all, 3 = nearly every day)}
#'   \item{gad7_07}{Over the last 2 weeks, how often have you been bothered by 
#'   the following problems: feeling afraid as if something awful might happen 
#'   (0 = not at all, 3 = nearly every day)}
#'   \item{hcsystem_rate}{I am rating my: 1 = direct supervisor, 2 = head of the 
#'   health system, 3 = entire leadership team for the healthcare system that I 
#'   work for}
#'   \item{hcsystem_01}{Easy to understand (0 = never, 4 = always)}
#'   \item{hcsystem_02}{Finds time to listen to group members}
#'   \item{hcsystem_03}{Refuses to explain their actions (0 = never, 4 = 
#'   always)}
#'   \item{hcsystem_04}{Acts without consulting the group members (0 = never, 
#'   4 = always)}
#'   \item{hcsystem_05}{Willing to make changes (0 = never, 4 = always)}
#'   \item{hcsystem_06}{Makes group members feel at ease when talking with or to 
#'   them (0 = never, 4 = always)}
#'   \item{hcsystem_07}{Puts suggestions made by the group into operation}
#'   \item{hcsystem_08}{Gets group input on important matters (0 = never, 4 = 
#'   always)}
#'   \item{hcsystem_09}{Speaks in a manner not to be questioned (0 = never, 4 = 
#'   always)}
#'   \item{hcsystem_10}{Makes sure that their part in the organization is 
#'   understood by all group members (0 = never, 4 = always)}
#'   \item{hcsystem_11}{Asks that group members follow standard rules and 
#'   regulations (0 = never, 4 = always)}
#'   \item{hcsystem_12}{Lets group members know what is expected of them 
#'   (0 = never, 4 = always)}
#'   \item{hcsystem_13}{Sees to it that group members are working up to 
#'   capacity (0 = never, 4 = always)}
#'   \item{hcsystem_14}{Sees to it that the work of all group members is 
#'   coordinated (0 = never, 4 = always)}
#'   ...
#' }
#' @source <https://pubmed.ncbi.nlm.nih.gov/35949164/>
"hcw"
