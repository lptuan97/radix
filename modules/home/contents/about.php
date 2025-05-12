<?php
if (!defined('_INCODE')) die('Access Deined...');

?>

<!-- About Us -->

<?php
$homeAbout = json_decode(getOption('home_about'), true);
function renderSkillHTML($nameSkill, $valueSkill, $delay ='')
{
    $nameSkill = !empty($nameSkill) ? $nameSkill : "";
    $valueSkill = !empty($valueSkill) ? $valueSkill : "";
    $html = '
    <div class="col-lg-6 col-md-6 col-12 wow fadeInUp" data-wow-delay="'.$delay.'s">
        <!-- Single Skill -->
        <div class="single-progress">
            <h4>' . $nameSkill . '</h4>
            <div class="progress">
                <div class="progress-bar" role="progressbar" style="width: ' . $valueSkill . '%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"><span class="percent">' . $valueSkill . '%</span></div>
                </div>
        </div>
        <!--/ End Single Skill -->
    </div>';
    return $html;
}

?>
<!-- html -->
<section class="about-us section">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-title wow fadeInUp">
                    <span class="title-bg">Radix</span>
                    <h1><?php renderValue($homeAbout['infomation']['title_bg']) ?></h1>
                    <p><?php renderValue(html_entity_decode($homeAbout['infomation']['desc'])) ?></p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 col-12 wow fadeInLeft" data-wow-delay="0.6s">
                <!-- Video -->
                <div class="about-video">
                    <div class="single-video overlay">
                        <a href="<?php renderValue($homeAbout['infomation']['video']) ?>" class="video-popup mfp-fade"><i class="fa fa-play"></i></a>
                        <img src="<?php renderValue($homeAbout['infomation']['image']) ?>" alt="#">
                    </div>
                </div>
                <!--/ End Video -->
            </div>
            <div class="col-lg-6 col-12 wow fadeInRight" data-wow-delay="0.8s">
                <!-- About Content -->
                <div class="about-content">
                    <?php renderValue(html_entity_decode($homeAbout['infomation']['content'])) ?>
                </div>
                <!--/ End About Content -->
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="progress-main">

                    <div class="row">
                        <?php
                        if (!empty($homeAbout['skill'])) {
                            $delay = 0.4;
                            foreach ($homeAbout['skill'] as $key => $value) {
                                echo renderSkillHTML($value['name'],$value['value'],$delay);
                                $delay += 0.2;
                            }
                        }
                        ?>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--/ End About Us -->


