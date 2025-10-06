import 'package:flutter/material.dart';
import 'package:movies/home/BrowseTab/FilteredScreen.dart';
import 'package:movies/utils/myTheme.dart';

import '../../data/model/movie_model.dart';

class CardItem extends StatelessWidget {
  final String title;
  final num? id;
  final List<Movie>? list;
  final Map<num,String> genre={
    28    : "https://image.tmdb.org/t/p/w500/628Dep6AxEtDxjZoGP78TsOxYbK.jpg",
    12    : "https://image.tmdb.org/t/p/w500/mfm4srsPALxaeOMFFFJ0drXTyXy.jpg",
    16    : "https://image.tmdb.org/t/p/w500/45zVtZx6Tzx3RKeDziK25K9geFf.jpg",
    35    : "https://image.tmdb.org/t/p/w500/45zVtZx6Tzx3RKeDziK25K9geFf.jpg" ,
    80    : "https://image.tmdb.org/t/p/w500/iiXliCeykkzmJ0Eg9RYJ7F2CWSz.jpg" ,
    99    : "https://image.tmdb.org/t/p/w500/qvZ91FwMq6O47VViAr8vZNQz3WI.jpg" ,
    18    : "https://image.tmdb.org/t/p/w500/pA3vdhadJPxF5GA1uo8OPTiNQDT.jpg" ,
    10751 : "https://image.tmdb.org/t/p/w500/45zVtZx6Tzx3RKeDziK25K9geFf.jpg" ,
    14    : "https://image.tmdb.org/t/p/w500/45zVtZx6Tzx3RKeDziK25K9geFf.jpg" ,
    36    : "https://image.tmdb.org/t/p/w500/9sl9k7FjE4g0vCVNkPdR1Fs3Yx8.jpg" ,
    27    : "https://image.tmdb.org/t/p/w500/7NRGAtu8E4343NSKwhkgmVRDINw.jpg" ,
    10402 : "https://image.tmdb.org/t/p/w500/45zVtZx6Tzx3RKeDziK25K9geFf.jpg" ,
    9648  : "https://image.tmdb.org/t/p/w500/kGzFbGhp99zva6oZODW5atUtnqi.jpg" ,
    10749 : "https://image.tmdb.org/t/p/w500/90ez6ArvpO8bvpyIngBuwXOqJm5.jpg" ,
    878   : "https://image.tmdb.org/t/p/w500/dIWwZW7dJJtqC6CgWzYkNVKIUm8.jpg" ,
    10770 : "https://image.tmdb.org/t/p/w500/qbWtbhoKtqta3rQDOe5ed80oB1X.jpg" ,
    53    : "https://image.tmdb.org/t/p/w500/8g9ZdvHX6jszRY71aVtpRUmHQzJ.jpg" ,
    10752 : "https://image.tmdb.org/t/p/w500/qvZ91FwMq6O47VViAr8vZNQz3WI.jpg" ,
    37    : "https://image.tmdb.org/t/p/w500/eoCSp75lxatmIa6aGqfnzwtbttd.jpg"
  };

  CardItem({super.key, required this.title, required this.id, required this.list});




  @override
  Widget build(BuildContext context) {
    List<Movie> outputList=[];
    for(int i = 0 ; i < (list?.length ?? 0.0);i++){
      for(int j =0 ;j < (list?[i].genreIds?.length ?? 0.0);j++){
          if(list?[i].genreIds?[j] == id)
          {
          outputList.add(list![i]);
          break;
          }
      }

    }
    return InkWell(
      onTap: (){Navigator.pushNamed(context,
          FilterScreen.routeName,
          arguments: FilterDataArgs(list: outputList, title: title)
      );},
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(genre[id]!,fit: BoxFit.fill),
          Container(color:MyThemeData.whiteColor.withValues(alpha: 0.5),child:
            Text(title,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 25,color: MyThemeData.darkGreyColor,),
            )
          )
        ],
      ),
    );
  }
}
