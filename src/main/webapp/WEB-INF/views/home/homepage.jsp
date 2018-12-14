<jsp:include page="header.jsp"/>
<%@ page contentType="text/html; charset=UTF-8" %>

<section class="padding-large bg-light">
    <div id="carouselExampleControls" class="carousel slide main-slider" data-ride="carousel">
        <div class="carousel-inner container">
            <div class="carousel-item">
                <div class="container w-75 d-flex">
                    <div class="carousel-caption d-block">
                        <h1>Don't hesitate any longer!</h1>
                        <h3> Start working out with us!</h3>
                    </div>
                </div>
            </div>
            <div class="carousel-item active">
                <div class="container w-75 d-flex">
                    <div class="carousel-caption d-block">
                        <h1>Register straight away!</h1>
                        <h3>Create your own fitness plans!</h3>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container w-75 d-flex">
                    <div class="carousel-caption d-block">
                        <a href="/userExercises"><h1>Explore our exercises!</h1></a>
                    </div>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</section>

<section class="section-more padding-small">
    <div class="container d-flex justify-content-between">
        <div class="mr-4">
            <h1 class="pb-3">Register and make your own fitness plans!</h1>
            <h4 class="pt-1">It's very easy and takes less than a minute!</h4>
        </div>
        <div class="ml-4 align-self-center">
            <button class="btn btn-color rounded-0 mt-4 pl-4 pr-4">
                <a href="/register">Create account</a>
            </button>
        </div>
    </div>
</section>

<section class="padding-small details bg-light">
    <div class="container">
        <div class="row">
            <div class="col text-center">
                <i class="fas fa-check icon-details"></i>
                <h1>Get inspired by others</h1>
                <p>Check out our user-created exercises for some inspiration and keeping things efficient.</p>
            </div>
            <div class="col text-center pr-4 pl-4 mr-4 ml-4">
                <i class="far fa-clock icon-details"></i>
                <h1>Fitness Planner saves time</h1>
                <p>
                    Creating your own plans and exercises is super easy and quick.
                </p>
            </div>
            <div class="col text-center">
                <i class="fas fa-list icon-details"></i>
                <h1>Manage your own plans</h1>
                <p>
                    Our app makes managing your fit plans super easy. Try it out!
                </p>
            </div>
        </div>
    </div>
</section>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>

<jsp:include page="footer.jsp"/>
