import 'package:flutter/material.dart';
import 'package:user_crud/dataclass.dart';

import 'dbservices.dart';

class DetData extends StatefulWidget {
  final DataUser? dataDet;

  const DetData({Key? key, this.dataDet}) : super(key: key);

  @override
  State<DetData> createState() => _DetDataState();
}

class _DetDataState extends State<DetData> {
  final _ctrEmail = TextEditingController();
  final _ctrName = TextEditingController();
  final _ctrPhoto = TextEditingController();
  final _ctrAddress = TextEditingController();
  final _ctrDescription = TextEditingController();
  bool _isDisabled = false;

  @override
  void dispose() {
    _ctrEmail.dispose();
    _ctrName.dispose();
    _ctrPhoto.dispose();
    _ctrAddress.dispose();
    _ctrDescription.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    _ctrEmail.text = widget.dataDet?.dataEmail ?? "";
    _ctrName.text = widget.dataDet?.dataName ?? "";
    _ctrPhoto.text = widget.dataDet?.dataPhoto ?? "";
    _ctrAddress.text = widget.dataDet?.dataAddress ?? "";
    _ctrDescription.text = widget.dataDet?.dataDescription ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.dataDet == null) {
      _isDisabled = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("User Data Detail"),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            ClipOval(
              child: Image.network(
                widget.dataDet?.dataPhoto ??
                    "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxAPEg8QEA8PEBAVFRUQFRcWEA8WFRYWFREXFhURFhYYHSgsGBomHRUWITIhJSorLi4uGB81ODMtNygtLisBCgoKDg0OGxAQGi4lHyYrLS0tLS0tLS0rMCstLS0tLS0tLS0tLS8tLS0vLS8tKystLS0rLSstLS0tLS0tLS0tLf/AABEIAOEA4QMBIgACEQEDEQH/xAAcAAEAAgMBAQEAAAAAAAAAAAAAAgcDBQYEAQj/xABHEAACAQIBCAYDDgQEBwAAAAAAAQIDBBEFBhIhMUFRYQcicYGRoRMysRQVI0JSVGJygpSiwdHSFjNTkiSTsvA0Q0Rzg7Px/8QAGgEBAAIDAQAAAAAAAAAAAAAAAAIFAQMEBv/EADARAAIBAQQHCAMBAQEAAAAAAAABAgMEESFBBRIxUWGx0SIycYGRocHwExXhI/Ez/9oADAMBAAIRAxEAPwC8QAAAAAAAAARnJJNtpJa22cjlzPqhRxhQXuiezHHCmvtfG7tXM2UqM6rugr/uZqq1oUlrTd33I69mhynnZZ2+KlW05r4tNaXnsXeytMrZeubtv0tWTj8iPVj/AGrb34mrLWlotbaj8l16epVVtKvZTj5vpl6+R3V90iVG2qFCC5zk5P8Atjhh4s0l1nhf1P8AqHBcIwhHzwx8zQA7oWSjDZFc+ZwTtdee2b8sOR7quV7ifrXFaXbUn+p45VG9sm+1tkQb0ktiNDlJ7XeSjNrY2uxnqpZVuIercVo9lSS/M8YDSe0KUlsZvLbO2/p7LiclwlGnPzax8zdWfSLVjgqtvCa4xlKL8Hjj5HEg0zstGfeguXLH3N8LXXhsm+fO9Fs5Nzzsq2Cc3Sm901h+JYrxZ0NOakk4tNPWmmmn2MoU9+TcrXFq8aNWceMccYvtT1M4aui4v/zd3B7PvkzupaVksKkb+K6f1F3g4jIuf1OeELmHopbNJYuL7VtXn3HZUasZxU4SjOLWKcWmmuKa2lVWoVKTumi1pV6dVXwd/P02mUAGo3AAAAAAAAAAAAAAAA1WW8t0LOGnVlrfqxWuUnyXDm9R4M6M5YWUdCOE7hrGMdyXypcuW1+ZVt9eVK85Vas3Octrfkkty5FhZLC6vbnhH3fRcfQrrZb1S7EMZey6vh6m0y/nPcXjab9HR3Qi9Xa38Z+XI0oBewhGEdWKuRQznKctaTvYABIgRAAAAABIiADJIiADBIiADJI2WRcvXFnLGlPqN4yhLXGXdufNGtImJRUlqyV6MxlKL1ou5lxZvZyULyOEXo1UsZU29a5xfxo8/HA3hQlGrKEozhJxnF4pp4NPimWZmlnbG5wo12o1/ivZGp2cHy37uCo7XYHT7dPFbs11XEvLHpBVHqVMJZPJ9HwOvABWloAAAAAAAAADm87M442UNGGEria6q3RWzTfLgt77zYZwZWhZ0ZVZ636sY75SeyPZvfJFOX13Ur1J1astKcni37EuCWzAsLDZPyvXn3V7vos/QrrfbPxLUh3n7Lq8iFatKpKU5ycpyelJt623vIkSRfnngAAAAACIJEQACREAkRJEQACREAkRJEQCQIgGSR8TwwabTWtNbU1saPgAuLOzKzo90pUKzXp0urL+okv9S38dvE7AoSnUlCUZRk4yi1JNPWmtjRbmaeXVeUsXgq0cI1F7JJcH7cSit9kVP/SGzNbv4Xuj7Z+T/Oe3J7/7zN+ACtLQAAAEZSSTbeCWtv8AMkcf0h5Y9DRVCDwnWx0uVNet47OzE2UaTqzUFmaq1VUoOcsvtxxuduW3eV20/gYYwguXxpdrw8MDRgHqYQUIqMdiPKznKcnKW1gkRJEiAAAAAABEAAAAAEiJIiASIkiIBIiSIgAAAyAAADYZCyrOzrQrQ14apR+VF+tH9OaRrwYlFSVz2MzFuLvW1F72txCrCFSD0oSSlF8U0ZzgOjbLHrWk3sxnS8etDzx8Tvzy9ooujUcPTwy+7z1VnrKtTU/t+YABpNx8xKWzjyk7u4q1ceq3ow+rHVHx/Nll56ZQ9z2laSeEpYUo/a9Z90dJ9xUBc6LpYOo/BfPT1KXStXGNNeL+Pn2AJES2KcEgAAAAAAAARB3nR7kCMoxvKsccf5Ka1YJ4elw7Vq8d6NNevGjDWl6bzfZ6Eq89WPm9y+7Fma/IeY9eslOs/QU3rUWsZtfV3d+vkdXb5j2EFhKlKo+MqlReUWkdOChq26vN967wwPQUrDQgrtVPxV5zVbMiwktVGUHxjVqeyTa8jmcs5g1Kac7afpYrXoSSU+5rVLy7yywYp22vB36zfB4ipYaE1dqpcVhy+Sg5RabTTTTwaaaaa2prcyJZ2fGbirwlcU44V4LF4L10lrXOSWzjs4YViX1mtEa8NZbc1uZQ2mzyoT1XismSIkiJvOYAAGQAAAAAD0ZPvJUKtOtD1oSUlzw2x7GsV3l32txGrCFSDxjOKmuxrFFEFn9HF/6S2dFvrUnh9mfWj56S7is0pS1oKosuT/vMtNF1dWbp5PHzXVcjrwAUZeld9KF31qFBPZF1H2yejH/S/E4U3+fFx6S9uOEdGC+zBY+bkaA9PZIalGK4c8Ty1snr15Pjd6YAAHQcwJESQBEAkACINVlG+0sYQfV3vjyXIjOair2ThBzdyPTRk7u4oWlNvCrUhSlJbcJSSk1ySxfcfoWhRjCMYQSjCKUYpbEksEl3FBdHKXvnZY/Kn/6KmB+gigt9SU5q/cehsFOMIO7eAAcJ3AAAApjOqwVvd14RWEdLSj9WS0sFyTbXcXOVd0l4e6o/9qOP90iy0XJqq1vXQrdKQTo625nKESQL08+RAAMgAAAAAA6vo4vPR3bpY6qsZR+1HrryT8TlD35BuPRXNvU+TUjj2OSUvJs1V4a9OUd6NtCepVjLivTMu8AHlLz12qUflurp3FxLjUm/xPA8JKpLFyfFt+LInr0rkkeNk75NgEiJkiCREkARANde3WOMY7N748uwjKSir2SjFydyI395jjCL1b3x5Lka9oyNEGjjk3J3s7oRUVcj05Fv/ctxb3G6nUhN84qXXXfHFH6TpTUkpRacWk01saaxTR+YGi2OivOyM4Rsa8sKkNVCTfrw/pfWju4rsK+2U20pLIsLHVSbg8yywAVxZAAAApvO6+Vxd15ReMU9CPZFaOK5NpvvO6z1ziVrTdKnL/ETWCweuEXtm+D4eO4qtFzoyg0nVeeC6+xS6Urp3Ulli+nuSABbFORAAMgAAAAAAN4a1t2gGUYeKLg9/lxQKx98pcQVH65F1+zPBOODa4NrwIHsyxT0K9xH5NScfCTPGWyd6vKeSuk0AACIJETyXVfHqrZvfEw2kSjFyIXdzj1Y7N748uw8TRmaINHLJtu9nVFJK5GFo+NGRolQt51Zwp04udSbUYxW1t7iDNiMFOlKcowhGUpSejGMU223sSS2syX9lWtqjp1oTpVY4PB6mt6kmvai7sysz6eT4Kc9GpdSXWnuhj/y6fBcXtfgltMv5u21/DQuIYtY6M08Jwx3xl+TxXI4JW2KlclhvO+Nik4Xt47itc2uk+tQSp3sJXEFqVSLiqqX0k8FPtxT44nc2fSBkyqsfdUab4VIzg13tYPuZwWXOi67pNytZwuYbk2qdTswfVfbiuw5a6zavqTwnZXK7KVSS8Ypow6VCpjF/fAkqtenhJX+Tfui6rnPzJlNYu8py5QU5v8ACmcvlPpKlXUo2VKVOGx1qijpf+OnrXfLwOAybmtd1pf8LcKO/wCCqrHkm15nbZKzDup4ekULanzwk8OUYv2tGylZrPDt1JK7i9vltNVW02mfYpxd/hs83hec6lUrT+PVqzlzlKUn7WLq2nSnKnUhKE46nFrWv1XMt7IWbtCyXwcXKo1g5y1yfJfJXJeYzhyDSvYaM9U16k0tcXwfGPFfnrN37SH5Lruzvz9Nl3A0/qp/jv1u1uy8L9t/Ep0GfKNjUtqk6NWOjOPg1uknvTMBaJpq9FU007mRAAAAAAAAAADMrEw3gez3DLgCyf4e+ivAFX+wRbfrZHDZ62/o724W6UlNfagm/PE0Z23SfaaNW3qpapRcH2xeK8peRxJ2WWevRjLhywfucVrhqV5rjzx+QAYatTcjc3cc6V5CvVx1LZvPM0ZWiDRqeJvjgjG0RaMjRFogTMbRafRbm4qdP3bVj8LUTVPFerDfPtl7MOLK8yJk13dxQt1j8JNRbW6K1za7Ipn6Bo04wjGEUoxilFJbEksEkV1uq6sVBZ8v+ljYKetJzeWzx/5zMoAKotgAAAAAAAADl89shq6oucF8PSTlHBa5R2yhz4rn2sqlF/FOZ4ZO9z3VSKWEJfCQ+rLHV3SUl3IuNGV206TyxXyvvEpdKUErqq8H8P49DSAAtyoAAAAAAB7MjW/pa9vT+VOMX2aSx8sTxnT9Htn6S7jPDVSjKfe1opeePca609SnKW5P+e5sow16kY8V6Z+xa4APJ3Hr9ZnNZ+ZP9NaTaWMqbVVdi1S/C2+4qYvqcFJOLWKaaa4p7UUllzJ7ta9Wg8erJ6L4p64vwa8y70XVvi6byxXh9u9Si0rRulGos8H8fPoa+pLcYWjK0fGiyZWIwtHxom0RaItE7zE0RaMrRBoiSTO06JrTSuatV7KdPBfWqSST8Iy8S2isOiy8oUVdurWpU3J0ktOpCOKSnjhpPXtO+9/LP55a/wCfS/Uo7YpOs8N3IvbFcqK8+bNiDW+/ln87tf8APpfqPf2z+eWv3il+pyastzOu9GyBrff6z+eWv3ij+4+e/wDZfPLT7xR/cNWW5i9bzZg1nv8A2Xzy1+8Uf3D+ILL55a/eKP7hqy3MXo2YNX/EFl89tPvFH9w/iGy+e2n3ij+4ar3C9G0OA6UbbFW1bg5U33pOPsl4nV/xDY/PbT7xR/cczn7lS2r20Y0rmhVmqkZYQq05ywwkm8IvZrOqxNxrx+5M5balKhNcORXYAPSHmQAAAAAAWV0a2OhQnXw11JaK+rDVj4t+BXVtbyqzhTgsZzkoR7W8EXdk+0jQpU6MPVhFQXPBbe17St0nV1aahm+S/vIs9F0tao5vYl7v+cz1gAoi+Bw/SRkf0kIXUF1qfUnzi31X3N/i5HcGKtSjOMoTSlGScZJ7GmsGmbaFZ0qimjVXoqrTcHnzKFaING3zjyRKzrzpPFw9anL5UXs71sfYato9RGSklKOxnlpRcZOMtqMbRjaMrR8aMBMwtEGjK0RaItEjE0RaMrRBoiSRiaPjRlaMbRglgQaINGRo+NGsmYWiLRlaINESRiaItGZo+0qLm9FbfZzZjFksEYqNBzajFa/ZzZvbS2jTWC273vZ9trdU1gu98TOdVOnq4vaclWpr4LYAAbTSAAAAD0ZNsJ3NWnRprrTeHJLfJ8ktYbSV7MpNu5HW9G+SNOUrua6scY0+cmutLuTw+0+BY55Mm2ULelClBYQgsFxe9yfNvF956zy9prfmqueWXh9x8z1NlofhpqGefj9w8gADQdAAABo86chxvaLjqVWOLpy4PfF8n+j3FQVqUoSlCcXGcW4yT2pramX2chnrmx7pi69Ff4iK1r+pFbvrLc9+zhhZWC1qm/xzeD2cH0eZWaQsbqL8kF2lt4rqsir2iDRlksMU001qae1NbmRaL1ookzG0Y2jK0fGiBJMwtEWjI0RaItEjE0RaMjRFoiTTMTRFoytEGiJIg0QaMjQp0nJ4L/fMjcSvMdOk5vBf/OZt7egoLBd74ihRUFgu98TIb6dPVxzOepUcsFsJHw+H02Gs+gAGAARAJJFqZlZvq0p6dRfD1F1voraodu98+w1WYua7jo3VxHCe2lB/F+nJceC3bduGHelLpC1qX+UNmb+Ou8vNHWPV/wBZ7clu4+eW4AAqi2AAAAAAAAAOPzvzRVzjWoJRr7ZLUlU/SXPfv4lZ1aUoSlGUXGUXg00001uaL8NBnHm1RvFpPqVksIzXlGS+MvMsrJb/AMa1KmzJ7v4VdssH5O3T25rf/eZT7RBo2mWMj17OehVhgn6slrjL6svy2muaLtNSV6d6KRpxbTVzMbRjaMrR8aMGUYWiDRlaItEWiRiaItGRoRg28ERuJ3mKFNyeCNhRpKKwXefadNRWCJG2MbjVOV+CJET6fCRA+g+EgAAejJ2T61zNU6NNzlvw2JcZPcu0NpK9hJt3I86O/wA0MztFxuLuPX9aFJ/F4Tnz4R3b9epbXNrNKlaYVJ4Va/ysNUfqp7/pPX2HUFLa9Iay1KWzN9OuZd2PR2r26u3JbvHf4ZcQACqLYAAAAAAAAAAAAAAAwXNvCrFwqQjOD1NSSaZw+W+j/bO0no7/AEcm/CM/yfid+DdRtFSi+w/LL0+s0VrPTrLtrzz9fqKHv7GrQloVqc6cuElhjzT2Ndh5Wi+7m3hVi4VIQnF7VKKa8GctlLMG1qYujKdCXBdaH9stfg0WtPScH31d7rqVVXRc4/8Am71xwfR+xVjRjaOxv+j+8p4um4Vl9GWhLwlgvM0N1kO6pfzLatHnoScf7ksDthWpz7skzilQqQ70WjVqGOo9EIJH1JR1bGfTco3HO5J7CREDH/eskk2YbS2kiJ7bbJVzV/l29WfNQnh44YG5scx72phpqFFfSmpPwjj54GqdanDvSS8/jabYUKk+7Fvyw9dhzZO2t51ZKFOEqk3sUU2/BFi5O6P6EEnXqTrPgupHy1+Z1VlY0qEdClThTjwjFLHm+L7Thq6Tpxwgr36LryO+loupLGbS930872cDkXMGc8J3ctCO3QTTm+UpbI92Pcd7YWFK3gqdGnGnFblv5t7W+bPWCprWmrW77w3ZffG8tqFlp0e4sd+f3wuAANB0AAAAAAAAAAAAAAAAAAAAAAAAAAGGSjtNFnFsZWGVfWYBdaO2FLpMw5P9ZFlZtfF7gCekdhDRveOoABRovZbQAARAAAAAAAAAAAAAAAP/2Q==",
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: _ctrEmail,
              enabled: _isDisabled,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email Address",
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: _ctrName,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Name",
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: _ctrPhoto,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Photo Link Address",
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: _ctrAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Address",
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: _ctrDescription,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Description",
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                final dt = DataUser(
                  dataEmail: _ctrEmail.text,
                  dataName: _ctrName.text,
                  dataPhoto: _ctrPhoto.text,
                  dataAddress: _ctrAddress.text,
                  dataDescription: _ctrDescription.text,
                );
                Database.tambahData(item: dt);
                if (_isDisabled) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Data ${_ctrEmail.text} created',
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Data ${_ctrEmail.text} edited',
                      ),
                    ),
                  );
                }
                Navigator.pop(context);
              },
              child: Text("Simpan Data"),
            ),
          ],
        ),
      ),
    );
  }
}
